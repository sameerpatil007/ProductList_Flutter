import 'package:flutter/material.dart';

class NoItemFound extends StatelessWidget {
  const NoItemFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 18.0,),
        Icon(
          Icons.no_food,
          size: 62,
          color: Colors.green.shade400,
        ),
        const SizedBox(height: 18.0,),
        const Text('No products found')
      ],
    );
  }
}
