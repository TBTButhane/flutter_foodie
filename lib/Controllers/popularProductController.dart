import 'package:get/get.dart';
import 'package:just_see/models/product_Model2.dart';
import 'package:just_see/util/popularRepo.dart';

// import '../models/product_model.dart';

class ProductController extends GetxController {
  final ProductRepo popularProductRepo;

  ProductController({required this.popularProductRepo});

  List<Product> _ProductList = [];
  List<Product> get Products => _ProductList;
  Future<void> getProductList() async {
    Response response = await popularProductRepo.GetProductsList();

    if (response.statusCode == 200) {
      print("got all products");
      // print(response.body);
      _ProductList = [];
      _ProductList.addAll(productsFromJson(response.body));
      update();
    } else {
      print("This is the response code: " + response.statusCode.toString());
      //TODO: Do someting here
    }
  }
}
