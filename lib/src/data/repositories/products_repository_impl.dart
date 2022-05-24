import 'package:assignment_1/src/domain/entities/product.dart';
import 'package:assignment_1/src/domain/repositories/products_repository.dart';

import '../datasource/local/products_data.dart';

class ProductsRepositoryImpl implements ProductRepository {
  const ProductsRepositoryImpl();

  @override
  Future<List<Product>> getProductList() async {
    return ProductSingletonDataSource.instance.getProductList;
  }

  @override
  Future<void> updateProductList(List<Product> productsList) async {
    ProductSingletonDataSource.instance.setProductList = productsList;
  }
}
