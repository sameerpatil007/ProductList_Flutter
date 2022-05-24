import 'dart:math';

import 'package:assignment_1/src/domain/usecases/get_products_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/update_products_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase _getProductsUseCase;
  final UpdateProductsUseCase _updateProductsUseCase;

  String searchTerm = '';

  ProductsBloc(this._getProductsUseCase, this._updateProductsUseCase) : super(const ProductsLoading()) {
    on<GetAllProducts>(_getAllProducts);
    on<GetSearchedProducts>(_getSearchedProducts);
    on<ReduceProductQuantity>(_reduceProductQuantity);
  }

  void _getAllProducts(GetAllProducts event, Emitter<ProductsState> emit) async {
    List<Product> products = await _getProductsUseCase.call();
    emit(ProductsLoaded(products: products, searchedProducts: products, quantityUpdateMessage: ''));
    add(const ReduceProductQuantity());
  }

  void _getSearchedProducts(GetSearchedProducts event, Emitter<ProductsState> emit) {
    searchTerm = event.searchTerm;

    if (state is ProductsLoaded) {
      List<Product> searchListToUpdate = <Product>[];
      searchListToUpdate = (state as ProductsLoaded)
          .products
          .where((Product productItem) =>
              productItem.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
              productItem.description.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();

      emit((state as ProductsLoaded).copyWith(searchedProducts: searchListToUpdate));
    }
  }

  void _reduceProductQuantity(ReduceProductQuantity event, Emitter<ProductsState> emit) async {
    await Future.delayed(const Duration(minutes: 1), () {
      if (state is ProductsLoaded) {
        List<Product> productsListCanUpdate =
            (state as ProductsLoaded).products.where((Product element) => element.quantity > 0).toList();
        Product productToUpdate = productsListCanUpdate[Random().nextInt(productsListCanUpdate.length)];

        List<Product> productsListToUpdate = <Product>[];
        for (Product productItem in (state as ProductsLoaded).products) {
          Product productToAdd = Product.fromJson(productItem.toJson()
            ..['quantity'] = productItem == productToUpdate ? productItem.quantity - 1 : productItem.quantity);
          productsListToUpdate.add(productToAdd);
        }

        _updateProductsUseCase.call(params: productsListToUpdate);

        emit(
          (state as ProductsLoaded).copyWith(
            products: productsListToUpdate,
            quantityUpdateMessage: 'Only ${productToUpdate.quantity - 1} ${productToUpdate.name} available now',
          ),
        );

        add(GetSearchedProducts(searchTerm: searchTerm));
      }
      add(const ReduceProductQuantity());
    });
  }
}
