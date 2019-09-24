import 'package:estuda_que_da/utils.dart';

import 'estudo.dart';

class Disciplina {
  int id;
  String nome;
  Duration tempoCiclo;

  String get tempoCicloFormatado => Utils.formatDuration(tempoCiclo);

  Disciplina([this.id, this.nome, this.tempoCiclo]);

  save() {
    id = 9;
    print('$id - $nome');
  }
  
  static List<Disciplina> get mocks {
    List<Disciplina> mocks = [];
    mocks.add(Disciplina(1, 'Português', Duration(hours: 0, minutes: 0, seconds: 15)));
    mocks.add(Disciplina(2, 'Direito Administrativo', Duration(hours: 1, minutes: 30)));
    mocks.add(Disciplina(3, 'Direito Constitucional', Duration(hours: 1, minutes: 30)));
    mocks.add(Disciplina(4, 'Direito Tributário', Duration(hours: 1, minutes: 30)));
    mocks.add(Disciplina(5, 'Contabilidade', Duration(hours: 1, minutes: 30)));
    return mocks;
  }

  static List<Disciplina> getDisciplinas() {
    return Disciplina.mocks;
  }

  List<Estudo> getEstudos() => Estudo.getEstudos(this).where((e) => e.idDisciplina == id).toList();
}
