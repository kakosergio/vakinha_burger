import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/delivery_button.dart';

class OrderCompleted extends StatelessWidget {
  const OrderCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.percentHeight(.2),
              ),
              Image.asset('assets/images/logo_rounded.png'),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Pedido realizado com sucesso. Em breve você receberá a confirmação do seu pedido',
                textAlign: TextAlign.center,
                style: context.textStyles.textExtraBold.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              DeliveryButton(
                width: context.percentWidth(.8),
                label: 'FECHAR',
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
