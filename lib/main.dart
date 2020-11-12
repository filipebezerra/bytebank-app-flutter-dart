import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transferências"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: ListaTransferencia(),
      ),
    ));

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardTransferencia(Transferencia(1000.00, 29200)),
        CardTransferencia(Transferencia(3000.00, 87878)),
        CardTransferencia(Transferencia(340.00, 190902)),
        CardTransferencia(Transferencia(12000.00, 87878)),
        CardTransferencia(Transferencia(2000.00, 87878)),
      ],
    );
  }
}

class CardTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  CardTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia._valor.toString()),
          subtitle: Text(_transferencia._numeroConta.toString()),
        )
    );
  }
}

class Transferencia {

  final double _valor;
  final int _numeroConta;

  Transferencia(this._valor, this._numeroConta);
}