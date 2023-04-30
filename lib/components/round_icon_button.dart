import 'package:flutter/material.dart';

class RoundCustomButton extends StatelessWidget {
  RoundCustomButton({super.key, this.icon, required this.function});

  final IconData? icon;
  void Function() function;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      fillColor: const Color(0xff7776A4),
      onPressed: function,
      child: Icon(icon),
    );
  }
}
