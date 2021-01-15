import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditorTextoField extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;
  final TextInputType tipoTeclado;
  final int tamanhoMaximo;

  const EditorTextoField({
    Key key,
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
    this.tipoTeclado,
    this.tamanhoMaximo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        maxLength: tamanhoMaximo,
        controller: controlador,
        decoration: InputDecoration(
          labelText: rotulo,
          helperText: dica,
          border: OutlineInputBorder(),
          prefixIcon: icone != null ? Icon(icone) : null,
        ),
        style: TextStyle(
          fontSize: 24.0,
        ),
        keyboardType: tipoTeclado,
      ),
    );
  }
}
