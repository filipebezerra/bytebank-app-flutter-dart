import 'package:flutter/material.dart';

import 'ui/transferencia/lista/lista.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.amberAccent[700],
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.green[900],
            selectionColor: Colors.amberAccent[700],
            selectionHandleColor: Colors.green[900],
          ),
        ),
        home: TransferenciaList(),
      );
}
