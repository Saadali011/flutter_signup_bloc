import 'package:bloctest/sign_in/SignIn.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{

  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;
  final ButtonStyle styleForm;
  final bool isEnabled; // Add this parameter


  RoundedButton({
    required this.styleForm,
    this.icon,
    this.bgColor,
    this.textStyle,
    this.callback,
    required this.btnName,
    this.isEnabled = true, // Set a default value for isEnabled

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? callback : null, // Set onPressed based on isEnabled
      child: icon!= null ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          Container(width: 13,),
          Text(btnName,style: textStyle,)
        ],
      ) : Text(btnName, style: textStyle,),
      style: styleForm,
    );
  }}

