import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String TextBoto;
  final Function()? accioBoto;
  const Button({
    super.key, 
    required this.TextBoto, 
    required this.accioBoto,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: accioBoto,
      color: Colors.teal[300],
      child: Text(TextBoto), 
    );
  }
}