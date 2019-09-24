import 'package:estuda_que_da/model/disciplina.dart';
import 'package:estuda_que_da/utils.dart';

class Estudo {
  int id;
  int idDisciplina;
  Disciplina disciplina;
  String material;
  int paginaInicial;
  int paginaFinal;
  DateTime tempoInicio;
  DateTime tempoFim;
  String observacao;


  Estudo([this.id, this.idDisciplina, this.material, this.paginaInicial, this.paginaFinal, this.tempoInicio, this.tempoFim, this.observacao]);

  String get tempoInicioFormatado => Utils.formatDate(tempoInicio);
  String get tempoFimFormatado => Utils.formatDate(tempoFim);
  String get tempoFimEstimadoFormatado => Utils.formatDate(tempoFimEstimado);
  String get tempoEstudadoFormatado => Utils.formatDuration(tempoEstudado);

  DateTime get tempoFimEstimado => tempoInicio == null
    ? null
    : tempoInicio.add(disciplina.tempoCiclo);

  Duration get tempoEstudado => tempoFim == null
    ? null
    : tempoFim.difference(tempoInicio);

  save() {
    print('id: $id');
    print('idDisciplina: $idDisciplina');
    print('material: $material');
    print('paginaInicial: $paginaInicial');
    print('paginaFinal: $paginaFinal');
    print('tempo_inicio: $tempoInicio');
    print('tempo_fim: $tempoFim');
  }

  static List<Estudo> getEstudos(Disciplina disciplina) {
    List<Estudo> mocks = [];
    mocks.add(Estudo(1, 1, 'Apostila 0', 3, 15, DateTime(2019, 9, 23, 12, 34, 10), DateTime(2019, 9, 23, 12, 56, 13), 'Beleza!'));
    mocks.add(Estudo(2, 1, 'Apostila 0', 3, 15, DateTime(2019, 9, 23, 12, 34, 10), DateTime(2019, 9, 23, 12, 56, 13), 'Beleza!'));
    mocks.add(Estudo(3, 1, 'Apostila 0', 3, 15, DateTime(2019, 9, 23, 12, 34, 10), DateTime(2019, 9, 23, 12, 56, 13), 'Beleza!'));
    mocks.add(Estudo(4, 2, 'Apostila 0', 3, 15, DateTime(2019, 9, 23, 12, 34, 10), DateTime(2019, 9, 23, 12, 56, 13), 'Beleza!'));
    mocks.add(Estudo(5, 2, 'Apostila 0', 3, 15, DateTime(2019, 9, 23, 12, 34, 10), DateTime(2019, 9, 23, 12, 56, 13), 'Beleza!'));
    mocks.add(Estudo(6, 3, 'Apostila 0', 3, 15, DateTime(2019, 9, 23, 12, 34, 10), DateTime(2019, 9, 23, 12, 56, 13), 'Beleza!'));
    mocks.add(Estudo(7, 3, 'Apostila 0', 3, 15, DateTime(2019, 9, 23, 12, 34, 10), DateTime(2019, 9, 23, 12, 56, 13), 'Beleza!'));
    mocks.add(Estudo(8, 4, 'Apostila 0', 3, 15, DateTime(2019, 9, 23, 12, 34, 10), DateTime(2019, 9, 23, 12, 56, 13), 'Beleza!'));
    return mocks;
  }
}