import 'package:assignment_1/src/domain/entities/product.dart';

import '../../core/usecase/usecase.dart';
import '../repositories/products_repository.dart';

class UpdateProductsUseCase implements UseCase<void, List<Product>> {
  final ProductRepository _productRepository;
  UpdateProductsUseCase(this._productRepository);

  @override
  Future<void> call({List<Product> params = const <Product>[]}) {
    return _productRepository.updateProductList(params);
  }
}
