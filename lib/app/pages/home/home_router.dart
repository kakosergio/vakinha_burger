import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(
              dio: context.read(),
            ),
          ),
        ],
      );
}
