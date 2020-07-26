import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      home: Scaffold(
        body: ListaTarefas(),
        appBar: AppBar(
          title: Text('π TO-DO'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    ));

class ListaTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ItemTarefa(Tarefa('Fazer MVP de Flutter',
            'O MVP de Flutter deve ser feito seguindo os padrões arara premium...')),
        ItemTarefa(Tarefa('Fazer exercícios físicos',
            'Às 22:00 deve-se começar com 1 hora de exercícios de calistenia, po...')),
        ItemTarefa(Tarefa('Fazer site Chevals',
            'O site da Chevals deve ser feito utilizando a tecnologia WordPress, para is...')),
      ],
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
}
