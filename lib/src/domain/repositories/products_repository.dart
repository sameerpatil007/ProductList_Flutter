import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProductList();

  Future<void> updateProductList(List<Product> product);
}
