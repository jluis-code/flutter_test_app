
import 'package:app_flutter_3_a/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputDataWidget extends StatelessWidget {


  const InputDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    return const CustomInputField(
        labelText: 'Ingresa un número',
        hintText: 'Número',
        keyboardType: TextInputType.number,
    );
  }
}