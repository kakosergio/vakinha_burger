import 'package:dw9_delivery_app/app/core/ui/helpers/loader.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/messages.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/delivery_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // showLoader();
        // await Future.delayed(const Duration(seconds: 2));
        // hideLoader();
        showError('Teste');
      }),
      appBar: DeliveryAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => DeliveryProductTile(
                  product: ProductModel(
                      id: 1,
                      name: 'Lanchinho',
                      description: 'Feio mas gostoso',
                      price: 15,
                      image:
                          'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800')),
            ),
          )
        ],
      ),
    );
  }
}
