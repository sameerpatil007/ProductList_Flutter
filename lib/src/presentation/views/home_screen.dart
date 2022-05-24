import 'package:assignment_1/src/domain/entities/product.dart';
import 'package:assignment_1/src/presentation/bloc/products_bloc.dart';
import 'package:assignment_1/src/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(const GetAllProducts());
  }

  void _onQuantityUpdate({String message = ''}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<ProductsBloc, ProductsState>(
        listenWhen: (ProductsState previous, ProductsState current) =>
            previous.quantityUpdateMessage != current.quantityUpdateMessage,
        listener: (BuildContext context, ProductsState state) {
          _onQuantityUpdate(message: state.quantityUpdateMessage);
        },
        child: Column(
          children: <Widget>[
            _buildSearchBar(),
            Expanded(child: _buildProductList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextFormField(
      onChanged: (String searchText) => context.read<ProductsBloc>().add(GetSearchedProducts(searchTerm: searchText)),
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Search',
      ),
    );
  }

  Widget _buildProductList() {
    return BlocBuilder<ProductsBloc, ProductsState>(
      buildWhen: (ProductsState previous, ProductsState current) =>
          previous.searchedProducts != current.searchedProducts,
      builder: (BuildContext context, ProductsState state) {
        return ListView.builder(
          itemCount: state.searchedProducts.length,
          itemBuilder: (BuildContext context, int index) {
            Product productToDisplay = state.searchedProducts[index];
            return BuildListItem(product: productToDisplay);
          },
        );
      },
    );
  }
}
