import 'package:flutter/material.dart';
import 'package:to_do_list/models/tarefa.dart';

import 'formulario_tarefa.dart';

bool _check = false;

class ListaTarefas extends StatefulWidget {
  @override
  _ListaTarefasState createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  final List<Tarefa> _tarefas = List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            setState(() {
              if (tarefaRecebida != null) {
                _tarefas.add(tarefaRecebida);
              }
            });
          });
        },
      ),
    );
  }
}

class ItemTarefa extends StatefulWidget {
  Tarefa _tarefa;

  ItemTarefa(this._tarefa);

  @override
  _ItemTarefaState createState() => _ItemTarefaState();
}

class _ItemTarefaState extends State<ItemTarefa> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: CheckboxListTile(
        title: Text(widget._tarefa.titulo),
        subtitle: Text(widget._tarefa.descricao),
        controlAffinity: ListTileControlAffinity.platform,
        value: _check,
        onChanged: (bool value) {
          setState((){
            _check = value;
          });
        },
        activeColor: Colors.blueAccent,
        checkColor: Colors.white,
      ),
    );
//    return Card(
//      child: ListTile(
//        leading: Icon(Icons.check_box_outline_blank),
//        title: Text(_tarefa.titulo),
//        subtitle: Text(_tarefa.descricao),
//      ),
//    );
  }
}
