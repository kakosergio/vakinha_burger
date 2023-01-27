import 'package:flutter/material.dart';

import '../../core/ui/widgets/delivery_app_bar.dart';

class HomePage extends StatelessWidget {

  const HomePage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: DeliveryAppBar(),
           body: Container(),
       );
  }
}