import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.amberAccent[700],
      ),
      home: TransferenciaList(),
    );
  }
}

class CadastroTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CadastroTransferenciaState();
  }
}

class CadastroTransferenciaState extends State<CadastroTransferencia> {
  final TextEditingController _controladorNumeroContaTexto =
      TextEditingController();
  final TextEditingController _controladorValorTexto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando transferência"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            EditorTextoField(
              controlador: _controladorNumeroContaTexto,
              rotulo: 'Número da conta',
              icone: Icons.account_balance_wallet_outlined,
              dica: 'Deve seguir o formato 00000-0',
              tipoTeclado: TextInputType.number,
              tamanhoMaximo: 7,
            ),
            EditorTextoField(
              controlador: _controladorValorTexto,
              rotulo: 'Valor',
              icone: Icons.monetization_on_outlined,
              dica: 'Deve seguir o formato 0.000,00',
              tipoTeclado: TextInputType.numberWithOptions(decimal: true),
              tamanhoMaximo: 16,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.save),
        label: Text("Enviar"),
        onPressed: () => _criarTransferencia(context),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorNumeroContaTexto.text);
    final double valor = double.tryParse(_controladorValorTexto.text);
    if (numeroConta != null && valor != null) {
      final Transferencia novaTransferencia = Transferencia(valor, numeroConta);
      /*Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Transferência criada com sucesso"),
        ),
      );*/
      Navigator.pop(context, novaTransferencia);
    }
  }
}

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
        cursorColor: Theme.of(context).cursorColor,
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

class TransferenciaList extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return TransferenciaListState();
  }
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
        itemBuilder: (context, indice) {
          return TransferenciaCard(widget._transferencias[indice]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future = Navigator.of(context)
              .push(SlideRightRoute(page: CadastroTransferencia()));

          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              debugPrint('Transferencia recebida: $transferenciaRecebida');
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferenciaCard extends StatelessWidget {
  final Transferencia transferencia;

  const TransferenciaCard(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(transferencia._valor.toString()),
      subtitle: Text(transferencia._numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double _valor;
  final int _numeroConta;

  Transferencia(this._valor, this._numeroConta);

  @override
  String toString() {
    return "<Transferencia numeroConta=$_numeroConta, valor=$_valor >";
  }
}

// https://medium.com/flutter-community/everything-you-need-to-know-about-flutter-page-route-transition-9ef5c1b32823
class SlideRightRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
