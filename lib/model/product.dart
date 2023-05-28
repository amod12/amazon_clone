import 'dart:convert';

class Product {
  final String name;
  final String description;
  final String category;
  final double quantity;
  final double price;
  final List<String> images;
  final String? id;
  //String? userId; 
  
  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.quantity,
    required this.price,
    required this.images,
    this.id,
    //this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      
    };
  }
    // //if(userId != null){
    //   result.addAll({'userId': userId});
    // }
  
   

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      id: map['_id'],
      //userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
