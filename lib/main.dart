import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
  home: Scaffold(
    body: Column(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('Fazer MVP de Flutter'),
            subtitle: Text('O MVP de Flutter deve ser feito seguindo os padrões arara premium...'),
          ),
        ),Card(
          child: ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('Fazer exercícios físicos'),
            subtitle: Text('Às 22:00 deve-se começar com 1 hora de exercícios de calistenia, po...'),
          ),
        ),
      ],
    ),
    appBar: AppBar(
      title: Text('TO-DO π'),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {  },),
  ),
));
