import 'package:app_flutter_3_a/src/models/island_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType, 
    this.obscureText = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final islandModelProvider =  Provider.of<IslandModel>(context, listen: false);
    
    return TextFormField (
      style: const TextStyle(
        fontSize: 20
      ),
      autofocus: false,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      obscureText: obscureText,
      onChanged: (value) {
        islandModelProvider.matrizSize = (int.tryParse(value) == null  || int.tryParse(value)! > 20) ?  0 : int.parse(value);
      },
      validator:(value) {
        if(value == null) return 'Este campo es requerido';
        if (int.tryParse(value) == null  || int.tryParse(value)! > 20) {
          return 'Debe ingresar un numero mayor a cero y menor o igual a 20';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        icon:  icon != null ? Icon(icon) : null,
      ),
    );

  }
}