import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productsRepository.findAllProducts();
      emit(
        state.copyWith(
          status: HomeStateStatus.ready,
          products: products,
        ),
      );
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }

  void addOrUpdateCart(OrderProductDto orderProduct) {
    // copia a lista e cria uma nova usando o destruction
    final shoppingCart = [...state.shoppingCart];

    // procura no shoppingCart se tem um index com aquele produto
    final orderIndex = state.shoppingCart
        .indexWhere((orderP) => orderP.product == orderProduct.product);

    // se tiver, atualiza as informações com o produto novo
    if (orderIndex != -1) {
      // se a quantidade for reduzida a zero, remove do carrinho
      if (orderProduct.amount == 0) {
        shoppingCart.removeAt(orderIndex);
      } else {
        shoppingCart[orderIndex] = orderProduct;
      }
    } else {
      // se não, adiciona o produto
      shoppingCart.add(orderProduct);
    }
    // emite o estado
    emit(state.copyWith(shoppingCart: shoppingCart));
  }

  void updateCart(List<OrderProductDto> updateCart) => emit(state.copyWith(shoppingCart: updateCart));
}
