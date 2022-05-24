import 'package:assignment_1/src/domain/entities/product.dart';
import 'package:flutter/material.dart';

class BuildListItem extends StatelessWidget {
  const BuildListItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: Text('${product.quantity} Left'),
    );
  }
}
