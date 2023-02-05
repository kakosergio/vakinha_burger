import 'package:dw9_delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/models/payment_types_model.dart';
import 'package:dw9_delivery_app/app/pages/order/order_controller.dart';
import 'package:dw9_delivery_app/app/pages/order/widgets/order_field.dart';
import 'package:dw9_delivery_app/app/pages/order/widgets/order_product_tile.dart';
import 'package:dw9_delivery_app/app/pages/order/widgets/payment_types_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';
import '../../dto/order_product_dto.dart';
import 'order_state.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  final _formKey = GlobalKey<FormState>();
  final _addressEC = TextEditingController();
  final _documentEC = TextEditingController();
  int? paymentTypeId;
  final paymentTypeValid = ValueNotifier<bool>(true);

  @override
  void onReady() {
    super.onReady();
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
          any: hideLoader,
          loading: showLoader,
          error: () {
            hideLoader();
            showError(state.errorMessage ?? 'Erro não informado');
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Carrinho',
                        style: context.textStyles.textTitle,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/trashRegular.png'),
                      ),
                    ],
                  ),
                ),
              ),
              BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
                selector: (state) => state.orderProducts,
                builder: (context, orderProducts) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: orderProducts.length,
                      (context, index) {
                        final orderProduct = orderProducts[index];
                        return Column(
                          children: [
                            OrderProductTile(
                              index: index,
                              orderProduct: orderProduct,
                            ),
                            const Divider(color: Colors.grey),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total do pedido',
                            style: context.textStyles.textExtraBold
                                .copyWith(fontSize: 16),
                          ),
                          Text(
                            r'R$ 200,00',
                            style: context.textStyles.textExtraBold
                                .copyWith(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OrderField(
                      title: 'Endereço de entrega',
                      controller: _addressEC,
                      validator: Validatorless.required('Endereço obrigatório'),
                      hintText: 'Digite o endereço',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OrderField(
                      cpf: true,
                      title: 'CPF',
                      controller: _documentEC,
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required('CPF obrigatório'),
                          Validatorless.cpf('CPF inválido'),
                        ],
                      ),
                      hintText: 'Digite o CPF',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocSelector<OrderController, OrderState,
                        List<PaymentTypesModel>>(
                      selector: (state) => state.paymentTypes,
                      builder: (context, paymentTypes) {
                        return ValueListenableBuilder(
                          valueListenable: paymentTypeValid,
                          builder: (BuildContext context, paymentTypeValidValue,
                                  Widget? child) =>
                              PaymentTypesField(
                            valid: paymentTypeValidValue,
                            valueSelected: paymentTypeId.toString(),
                            valueChanged: (value) => paymentTypeId = value,
                            paymentTypes: paymentTypes,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DeliveryButton(
                        width: double.infinity,
                        height: 48,
                        label: 'FINALIZAR',
                        onPressed: () {
                          final valid =
                              _formKey.currentState?.validate() ?? false;
                          final paymentTypeSelected = paymentTypeId != null;
                          paymentTypeValid.value = paymentTypeSelected;

                          if (valid) {}
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
