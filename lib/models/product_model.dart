class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.slug,
    required this.stock,
    required this.image,
  });

  String id;
  String title;
  double price;
  String description;
  String slug;
  int stock;
  String image;
}
