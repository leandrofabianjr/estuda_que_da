import 'package:estuda_que_da/utils.dart';

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
  
  static List<Disciplina> get stubs {
    List<Disciplina> stubs = [];
    stubs.add(new Disciplina(1, 'Português', Duration(hours: 0, minutes: 0, seconds: 15)));
    stubs.add(new Disciplina(2, 'Direito Administrativo', Duration(hours: 1, minutes: 30)));
    stubs.add(new Disciplina(3, 'Direito Constitucional', Duration(hours: 1, minutes: 30)));
    stubs.add(new Disciplina(4, 'Direito Tributário', Duration(hours: 1, minutes: 30)));
    stubs.add(new Disciplina(5, 'Contabilidade', Duration(hours: 1, minutes: 30)));
    return stubs;
  }

  static List<Disciplina> getDisciplinas() {
    return Disciplina.stubs;
  }
}
