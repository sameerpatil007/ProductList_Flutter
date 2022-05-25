import 'package:assignment_1/src/core/utils/constants.dart';
import 'package:assignment_1/src/data/repositories/products_repository_impl.dart';
import 'package:assignment_1/src/domain/repositories/products_repository.dart';
import 'package:assignment_1/src/domain/usecases/get_products_usecase.dart';
import 'package:assignment_1/src/domain/usecases/update_products_usecase.dart';
import 'package:assignment_1/src/presentation/bloc/products_bloc.dart';
import 'package:assignment_1/src/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final ProductRepository _productsRepository = const ProductsRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),
        scaffoldBackgroundColor: Colors.grey.shade50,
      ),
      home: BlocProvider(
        create: (BuildContext context) => ProductsBloc(
          GetProductsUseCase(_productsRepository),
          UpdateProductsUseCase(_productsRepository),
        ),
        child: const MyHomePage(title: kMaterialAppTitle),
      ),
    );
  }
}
