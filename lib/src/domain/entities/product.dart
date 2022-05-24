import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String description;
  final int quantity;

  const Product({
    required this.name,
    required this.description,
    required this.quantity,
  });

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'quantity': quantity,
      };

  @override
  List<Object?> get props => [name, description, quantity];
}
