import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'X-Burger',
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                child: Text(
                  'Lanche acompanha pão, hambúguer, mussarela, alface, tomate e maionese',
                  style:
                      context.textStyles.textExtraBold.copyWith(fontSize: 22),
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                height: 68,
                padding: const EdgeInsets.all(8),
                width: context.percentWidth(.5),
                child: DeliveryIncrementDecrementButton(
                  amount: 1,
                  decrementTap: () {},
                  incrementTap: () {},
                ),
              ),
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Adicionar',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 13),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //! Notei que o AutoSizeText quebra o MainAxisAlignment.spaceBetween.
                      //! Estou retornando para um Text comum por esse motivo, até encontrar um fix
                      // Expanded(
                      //   child: AutoSizeText(
                      //       r'R$ 6,99',
                      //       maxFontSize: 13,
                      //       minFontSize: 5,
                      //       maxLines: 1,
                      //       style: context.textStyles.textExtraBold
                      //     ),
                      // ),
                      Text(
                        r'R$ 6,99',
                        style: context.textStyles.textExtraBold,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}