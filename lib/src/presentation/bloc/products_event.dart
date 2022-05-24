part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => <Object>[];
}

class GetAllProducts extends ProductsEvent {
  const GetAllProducts();
}

class GetSearchedProducts extends ProductsEvent {
  final String searchTerm;

  const GetSearchedProducts({this.searchTerm = ''});

  @override
  List<Object?> get props => <Object>[searchTerm];
}

class ReduceProductQuantity extends ProductsEvent {
  const ReduceProductQuantity();
}
