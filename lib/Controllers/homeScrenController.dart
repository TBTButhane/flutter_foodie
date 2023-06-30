import 'package:get/get.dart';
import 'package:just_see/db/database.dart';
import 'package:just_see/models/name_model.dart';

class HomeScreenController extends GetxController {
  var users = <NameModel>[].obs;
  var _dbCall = DatabaseH.instance;
  bool isLoading = false;
  var counter = 0.obs;

  Future showAll() async {
    isLoading = true;
    List<Map<String, dynamic>> quaryAll = await DatabaseH.quaryAll();
    users.assignAll(quaryAll.map((e) => NameModel.fromJson(e)).toList());
    isLoading = false;
  }

  Future<int> createUser({NameModel? nameModel}) async {
    // return await DatabaseH.instance.inset(nameModel);
    return DatabaseH.inset(nameModel);
  }

  void deleteUser(NameModel nameModel) {
    _dbCall.delete(nameModel);
  }

  Future updateUser(NameModel nameModel) async {
    await _dbCall.update(nameModel);
  }

  // void createUser(context) async {
  //   isLoading = true;
  //   final user = NameModel(name: textEditingController.text);
  //   await DatabaseH.instance.inset(user);
  //   isLoading = false;
  //   textEditingController.clear();
  //   Navigator.pop(context);
  // }

  // void delete(int index) {
  //   users.removeAt(index);
  // }
}
