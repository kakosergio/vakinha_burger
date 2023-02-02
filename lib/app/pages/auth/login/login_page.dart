import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: context.textStyles.textTitle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido.')
                      ]),
                      decoration: const InputDecoration(labelText: 'E-mail'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _passwordEC,
                      validator: Validatorless.required('Senha obrigatória'),
                      decoration: const InputDecoration(labelText: 'Senha'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    DeliveryButton(
                        width: double.infinity,
                        label: 'ENTRAR',
                        onPressed: () {
                          final valid =
                              _formKey.currentState?.validate() ?? false;

                              if (valid){
                                
                              }
                        }),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não possui uma conta?',
                      style: context.textStyles.textBold,
                    ),
                    TextButton(
                      child: Text(
                        'Cadastre-se',
                        style: context.textStyles.textBold
                            .copyWith(color: Colors.blue),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/auth/register'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
