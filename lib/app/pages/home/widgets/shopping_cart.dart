import 'package:dw9_delivery_app/app/core/extensions/formatter_extension.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../dto/order_product_dto.dart';

class ShoppingCart extends StatelessWidget {
  final List<OrderProductDto> cart;
  const ShoppingCart({
    Key? key,
    required this.cart,
  }) : super(key: key);

  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      //Envio para o login
      final loginResult = await navigator.pushNamed('/auth/login');
      
    }

    // Envio para o Order
  }

  @override
  Widget build(BuildContext context) {
    var totalCart =
        cart.fold<double>(0.0, (v1, v2) => v1 + v2.totalPrice).currencyPTBR;
    return Container(
      padding: const EdgeInsets.all(10),
      width: context.screenWidth,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () => _goOrder(context),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.shopping_cart_outlined),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Ver sacola',
                style: context.textStyles.textExtraBold
                    .copyWith(color: Colors.white, fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalCart,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}
