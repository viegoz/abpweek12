class Product {
  int id;
  String name;
  String description;
  double price;
  int stock;
  String imageUrl;

  // Constructor
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.imageUrl,
  });

  // Method to create a Product object from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      stock: json['stock'],
      imageUrl: json['imageUrl'],
    );
  }

  // Method to convert a Product object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
      'imageUrl': imageUrl,
    };
  }
}

void main() {
  // Example usage
  Map<String, dynamic> productJson = {
    'id': 1,
    'name': 'Product Name',
    'description': 'Product Description',
    'price': 29.99,
    'stock': 100,
    'imageUrl': 'http://example.com/product.jpg',
  };

  // Convert JSON to Product object
  Product product = Product.fromJson(productJson);
  print('Product name: ${product.name}');

  // Convert Product object to JSON
  Map<String, dynamic> json = product.toJson();
  print('Product JSON: $json');
}
