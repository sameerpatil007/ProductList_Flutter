import 'package:flutter/material.dart';

class NoItemFound extends StatelessWidget {
  const NoItemFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 24.0,),
          Icon(
            Icons.no_food,
            size: 62,
            color: Colors.green.shade400,
          ),
          const SizedBox(height: 18.0,),
          Text('No products found',style: Theme.of(context).textTheme.titleLarge,)
        ],
      ),
    );
  }
}
