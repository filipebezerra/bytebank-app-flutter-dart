import 'package:bytebank/components/editor_texto.dart';
import 'package:bytebank/domain/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CadastroTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CadastroTransferenciaState();
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
      Navigator.pop(context, novaTransferencia);
    }
  }
}
