import 'package:get/get.dart';
import 'package:just_see/Controllers/popularProductController.dart';
import 'package:just_see/util/apiClient.dart';
import 'package:just_see/util/popularRepo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://fakestoreapi.com"));
  //repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
//Controllers
  Get.lazyPut(() => ProductController(popularProductRepo: Get.find()));
}
