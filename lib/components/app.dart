import 'package:flutter/material.dart';
import 'package:to_do_list/screens/lista_tarefas.dart';

class ToDoPi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue[700],
          accentColor: Colors.blue[700],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blue[700],
              textTheme: ButtonTextTheme.primary),
          brightness: Brightness.dark
      ),
//      themeMode: ThemeMode.dark,
      home: ListaTarefas(),
    );
  }
}
