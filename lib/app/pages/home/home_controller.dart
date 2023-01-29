import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    
  }
}
