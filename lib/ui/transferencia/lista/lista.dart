import 'package:bytebank/components/slide_right_route.dart';
import 'package:bytebank/domain/models/transferencia.dart';
import 'package:bytebank/ui/transferencia/cadastro/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransferenciaList extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() => TransferenciaListState();
}

class TransferenciaListState extends State<TransferenciaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) =>
            TransferenciaCard(widget._transferencias[indice]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navegaParaCadastro(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _navegaParaCadastro(BuildContext context) {
    Navigator.of(context)
        .push(SlideRightRoute(page: CadastroTransferencia()))
        .then((transferenciaRecebida) {
      if (transferenciaRecebida != null) {
        setState(() => widget._transferencias.add(transferenciaRecebida));
      }
    });
  }
}

class TransferenciaCard extends StatelessWidget {
  final Transferencia transferencia;

  const TransferenciaCard(this.transferencia);

  @override
  Widget build(BuildContext context) => Card(
          child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta.toString()),
      ));
}
