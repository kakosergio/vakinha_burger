import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textStyles.textMedium.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _nameEC,
                    validator: Validatorless.required('Nome obrigatório'),
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _emailEC,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido')
                      ],
                    ),
                    decoration: const InputDecoration(labelText: 'E-mail'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordEC,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Senha obrigatória'),
                        Validatorless.min(
                            6, 'Senha deve conter pelo menos 6 caracteres')
                      ],
                    ),
                    decoration: const InputDecoration(labelText: 'Senha'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Confirma Senha obrigatória'),
                        Validatorless.compare(
                            _passwordEC, 'Confirma senha diferente de Senha'),
                      ],
                    ),
                    decoration:
                        const InputDecoration(labelText: 'Confirma senha'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: DeliveryButton(
                        width: double.infinity,
                        label: 'CADASTRAR',
                        onPressed: () {
                          final valid = _formKey.currentState?.validate() ?? false;

                          if (valid){
                            
                          }

                        }),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
