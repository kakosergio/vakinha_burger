import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  ready,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingCart;
  const HomeState({
    required this.status,
    required this.products,
    this.errorMessage,
    required this.shoppingCart,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shoppingCart = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage, shoppingCart];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDto>? shoppingCart
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      shoppingCart: shoppingCart ?? this.shoppingCart,
    );
  }
}
