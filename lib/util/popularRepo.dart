import 'package:get/get.dart';
import 'package:just_see/util/apiClient.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;

  ProductRepo({required this.apiClient});
  Future<Response> GetProductsList() async {
    //TODO: Input the right uri date
    return await apiClient.getData('/products');
  }
}
