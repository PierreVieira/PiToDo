import 'package:flutter/material.dart';

main() => runApp(ToDoPi());

class ToDoPi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTarefas(),
      ),
    );
  }
}

class FormularioTarefa extends StatelessWidget {
  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controladorDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Tarefa'),
      ),
      body: Column(
        children: <Widget>[
          EditorTarefa(
            controlador: _controladorTitulo,
            labelText: 'Tarefa',
            hintText: 'Titulo',
            fontSize: 24.0,
          ),
          EditorTarefa(
            controlador: _controladorDescricao,
            labelText: 'Detalhes',
            hintText: 'Descrição',
            fontSize: 16.0,
            icone: Icons.description,
          ),
          RaisedButton(
            onPressed: () => _criarTarefa(context),
            child: Text('Adicionar'),
          )
        ],
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

class ListaTarefas extends StatelessWidget {
  final List<Tarefa> _tarefas = List();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _tarefas.add(Tarefa('Fazer MVP', 'Descricao: Fazendo o MVP'));
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Tarefas'),
      ),
      body: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (BuildContext context, int index) {
          final Tarefa tarefa = _tarefas[index];
          return ItemTarefa(tarefa);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Tarefa> future = Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormularioTarefa()));
          future.then((tarefaRecebida) {
            debugPrint('chegou no then do future');
            debugPrint('$tarefaRecebida');
            _tarefas.add(tarefaRecebida);
          });
        },
      ),
    );
  }
}

class ItemTarefa extends StatelessWidget {
  Tarefa _tarefa;

  ItemTarefa(this._tarefa);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.check_box_outline_blank),
        title: Text(_tarefa.titulo),
        subtitle: Text(_tarefa.descricao),
      ),
    );
  }
}

class Tarefa {
  final String titulo, descricao;

  Tarefa(this.titulo, this.descricao);

  @override
  String toString() {
    return 'Tarefa{titulo: $titulo, descricao: $descricao}';
  }
}
