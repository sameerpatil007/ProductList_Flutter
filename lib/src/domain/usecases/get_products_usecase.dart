import 'package:assignment_1/src/domain/entities/product.dart';

import '../../core/usecase/usecase.dart';
import '../repositories/products_repository.dart';

class GetProductsUseCase implements UseCase<List<Product>, void> {
  final ProductRepository _productRepository;
  GetProductsUseCase(this._productRepository);

  @override
  Future<List<Product>> call({void params}) {
    return _productRepository.getProductList();
  }
}
