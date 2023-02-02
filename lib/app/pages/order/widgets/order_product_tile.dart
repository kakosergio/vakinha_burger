import 'package:flutter/material.dart';

import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTile({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Text('$index');
  }
}
