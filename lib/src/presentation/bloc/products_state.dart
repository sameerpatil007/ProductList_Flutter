part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  final List<Product> products;
  final List<Product> searchedProducts;
  final String quantityUpdateMessage;

  const ProductsState({
    this.products = const <Product>[],
    this.searchedProducts = const <Product>[],
    this.quantityUpdateMessage = '',
  });

  @override
  List<Object> get props => <Object>[products, searchedProducts, quantityUpdateMessage];
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsLoaded extends ProductsState {
  const ProductsLoaded({
    List<Product> products = const <Product>[],
    List<Product> searchedProducts = const <Product>[],
    String quantityUpdateMessage = '',
  }) : super(
          products: products,
          searchedProducts: searchedProducts,
          quantityUpdateMessage: quantityUpdateMessage,
        );

  ProductsLoaded copyWith({
    List<Product>? products,
    List<Product>? searchedProducts,
    String? quantityUpdateMessage,
  }) {
    return ProductsLoaded(
      products: products ?? this.products,
      searchedProducts: searchedProducts ?? this.searchedProducts,
      quantityUpdateMessage: quantityUpdateMessage ?? this.quantityUpdateMessage,
    );
  }
}
