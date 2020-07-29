import 'package:flutter/material.dart';

class EditorTarefa extends StatelessWidget {
  final TextEditingController controlador;
  final String labelText;
  final String hintText;
  final double fontSize;
  final IconData icone;

  EditorTarefa(
      {this.controlador,
        this.labelText,
        this.hintText,
        this.fontSize,
        this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: this.fontSize,
        ),
        decoration: InputDecoration(
            labelText: this.labelText,
            hintText: this.hintText,
            icon: this.icone != null ? Icon(this.icone) : null),
        keyboardType: TextInputType.text,
      ),
    );
  }
}