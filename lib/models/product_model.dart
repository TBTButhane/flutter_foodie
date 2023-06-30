class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _productModel;
  List<ProductModel> get products => _productModel;

  Product(
      {required totalSize,
      required typeId,
      required offset,
      required productModel}) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._productModel = productModel;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];

//check if json[products] is not to null, we check if we have something in our list off products
    if (json['Products'] != null) {
      // make sure ur list is set to an empty one to avoid duplication of products
      _productModel = <ProductModel>[];
      json['products'].forEach((p) {
        _productModel.add(ProductModel.fromJson(p));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.typeId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }
}
