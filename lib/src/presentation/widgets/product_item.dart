import 'package:assignment_1/src/core/utils/extension.dart';
import 'package:assignment_1/src/domain/entities/product.dart';
import 'package:flutter/material.dart';

class BuildListItem extends StatelessWidget {
  const BuildListItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2.0),
      borderOnForeground: true,
      elevation: 0,
      child: ListTile(
        tileColor: Colors.white,
        title: Text(
          product.name.capitalize(),
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        subtitle: Text(product.description.capitalize()),
        trailing: Text(
          '${product.quantity} left',
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
    );
  }
}
