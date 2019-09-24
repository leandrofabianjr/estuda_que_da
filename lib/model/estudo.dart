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
}