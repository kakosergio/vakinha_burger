import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {

  const ProductDetailPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Detalhes'),),
           body: const Text('Detalhe do produto'),
       );
  }
}