import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class OrderField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator<String?> validator;
  final String hintText;
  final bool? cpf;

  const OrderField(
      {super.key,
      required this.title,
      required this.controller,
      required this.validator,
      required this.hintText,
      this.cpf});

  @override
  Widget build(BuildContext context) {
    const defaultBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              style: context.textStyles.textRegular.copyWith(
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          TextFormField(
            keyboardType: cpf ?? false ? TextInputType.number : null,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
                hintText: hintText,
                border: defaultBorder,
                enabledBorder: defaultBorder,
                focusedBorder: defaultBorder),
          )
        ],
      ),
    );
  }
}
