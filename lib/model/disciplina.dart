class Disciplina {
  int id;
  String nome;

  Disciplina([this.id, this.nome]);

  save() {
    id = 9;
    print('$id - $nome');
  }
  
  static List<Disciplina> get stubs {
    List<Disciplina> stubs = [];
    stubs.add(new Disciplina(1, 'Português'));
    stubs.add(new Disciplina(2, 'Direito Administrativo'));
    stubs.add(new Disciplina(3, 'Direito Constitucional'));
    stubs.add(new Disciplina(4, 'Direito Tributário'));
    stubs.add(new Disciplina(5, 'Contabilidade'));
    return stubs;
  }

  static List<Disciplina> getDisciplinas() {
    return Disciplina.stubs;
  }
}
