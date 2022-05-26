import 'package:assignment_1/src/core/utils/extension.dart';
import 'package:assignment_1/src/domain/entities/product.dart';
import 'package:assignment_1/src/presentation/widgets/wave_shape.dart';
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
        contentPadding: const EdgeInsets.only(left: 14),
        tileColor: Colors.white,
        leading: _buildLeading(),
        title: _buildTitle(),
        subtitle: _buildDescription(),
        trailing: _buildQuantity(),
      ),
    );
  }

  int getNextInt(String character) => (character.codeUnitAt(0) * 100000 * 0xFFFFFF).toInt();

  Widget _buildLeading() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Color(getNextInt(product.name[0])).withOpacity(1.0),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          product.name[0].capitalize(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildQuantity() {
    return Stack(
      children: <Widget>[
        _buildBackgroundShape(),
        _buildQuantityText(),
      ],
    );
  }

  Widget _buildQuantityText() {
    return Positioned(
        bottom: 4,
        right: 4,
        child: Text(
          '${product.quantity}',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      );
  }

  Widget _buildBackgroundShape() {
    return FittedBox(
        child: SizedBox(
          width: 280,
          height: 200,
          child: CustomPaint(
            painter: WaveShapeBuilder(),
          ),
        ),
      );
  }

  Widget _buildDescription() => Text(product.description.capitalize());

  Widget _buildTitle() {
    return Text(
      product.name.capitalize(),
      style: const TextStyle(color: Colors.black, fontSize: 18.0),
    );
  }
}
