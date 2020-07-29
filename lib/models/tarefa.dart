class Tarefa {
  final String titulo, descricao;

  Tarefa(this.titulo, this.descricao);

  @override
  String toString() {
    return 'Tarefa{titulo: $titulo, descricao: $descricao}';
  }
}