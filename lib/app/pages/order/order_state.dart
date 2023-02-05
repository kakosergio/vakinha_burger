import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  ready,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;

  const OrderState({
    required this.status,
    required this.orderProducts,
  });

  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const [];

  @override
  List<Object?> get props => [];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDto>? orderProducts,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }
}
