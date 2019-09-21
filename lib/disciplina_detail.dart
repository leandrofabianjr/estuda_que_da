import 'package:estuda_que_da/model/disciplina.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisciplinaDetail extends StatelessWidget {
  Disciplina disciplina;

  DisciplinaDetail({Key key, @required this.disciplina}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Disciplinas')
        ),
        body: Container(
            child: Text('${disciplina.id} - ${disciplina.nome}')
        )
    );
  }
}