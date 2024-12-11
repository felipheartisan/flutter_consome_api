import 'package:flutter/material.dart';
import 'package:revisao_api/aluno.dart';
import 'package:revisao_api/controller_aluno.dart';
import 'package:revisao_api/helper_widgets.dart';
import 'package:revisao_api/result_application.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  // Declarando o controlador para consumir a API
  var controllerAluno = ControllerAluno();
  var aluno = Aluno();

  var codigoTextController = TextEditingController();
  var nomeTextController = TextEditingController();

  void Confirmar() {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => inserir(), icon: Icon(Icons.add)),
          IconButton(onPressed: () => excluir(), icon: Icon(Icons.delete)),
          IconButton(onPressed: () => atualizar(), icon: Icon(Icons.update)),
        ],
        title: const Text('Revisão Prova'),
      ),
      body: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    // Objetos que capturam os textos de cada caixa de texto

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Form(
        child: Column(
          children: [
            HelperWidgets.createTextForm("Código", "", codigoTextController),
            HelperWidgets.createTextForm("Nome", "", nomeTextController),
          ],
        ),
      ),
    );
  }

  void defineDados() {
    aluno.codigo = int.tryParse(codigoTextController.text);
    aluno.nome = nomeTextController.text;
  }

  Future<void> exibeMensagem(ResultApplication result) async {
    if (result.sucesso!) {
      await HelperWidgets.showMessageDialog(result.mensagem!, context);
    } else {
      var mensagem = "${result.mensagem} \n ${result.erro}";
      await HelperWidgets.showMessageDialog(mensagem, context);
    }
  }

  inserir() async {
    defineDados();
    ResultApplication result = await controllerAluno.inserir(aluno);
    await exibeMensagem(result);
  }

  excluir() async {
    defineDados();
    ResultApplication result = await controllerAluno.excluir(aluno.codigo!);
    await exibeMensagem(result);
  }

  atualizar() async {
    defineDados();
    ResultApplication result = await controllerAluno.atualizar(aluno);
    await exibeMensagem(result);
  }
}
