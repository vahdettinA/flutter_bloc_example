class ProductState {
  List<Product> list;
  ProductState({required this.list});
}

class Product {
  String name;
  int fiyat;
  Product({required this.fiyat, required this.name});
}
