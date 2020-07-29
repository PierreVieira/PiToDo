import 'package:flutter/material.dart';
import 'package:to_do_list/components/editor.dart';
import 'package:to_do_list/models/tarefa.dart';

const String _titleAppBar = 'Criar Tarefa';
const String _labelTarefa = 'Tarefa';
const String _labelDescricao = 'Detalhes';
const String _textDicaTarefa = 'Titulo';
const String _textDicaDescricao = 'Descrição';
const String _textButton = 'Adicionar';

class FormularioTarefa extends StatefulWidget {
  @override
  _FormularioTarefaState createState() => _FormularioTarefaState();
}

class _FormularioTarefaState extends State<FormularioTarefa> {
  final TextEditingController _controladorTitulo = TextEditingController();

  final TextEditingController _controladorDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EditorTarefa(
              controlador: _controladorTitulo,
              labelText: _labelTarefa,
              hintText: _textDicaTarefa,
              fontSize: 24.0,
            ),
            EditorTarefa(
              controlador: _controladorDescricao,
              labelText: _labelDescricao,
              hintText: _textDicaDescricao,
              fontSize: 16.0,
              icone: Icons.description,
            ),
            RaisedButton(
              onPressed: () => _criarTarefa(context),
              child: Text(_textButton),
            )
          ],
        ),
      ),
    );
  }

  void _criarTarefa(BuildContext context) {
    String tituloTarefa = _controladorTitulo.text;
    String conteudoDescricao = _controladorDescricao.text;
    if (conteudoDescricao == null) {
      conteudoDescricao = '';
    }
    if (tituloTarefa != null) {
      Tarefa tarefaCriada = Tarefa(tituloTarefa, conteudoDescricao);
      debugPrint(tarefaCriada.toString());
      Navigator.pop(context, tarefaCriada);
    }
  }
}