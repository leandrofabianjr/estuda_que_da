import 'package:estuda_que_da/estudo_listar.dart';
import 'package:estuda_que_da/model/disciplina.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'estudo_iniciar.dart';

class DisciplinaDetalhe extends StatelessWidget {
  Disciplina disciplina;

  DisciplinaDetalhe({Key key, @required this.disciplina}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${disciplina.nome}'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.collections_bookmark),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EstudoListar(disciplina: disciplina))
                );
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.book),
          label: Text('Estudar'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EstudoIniciar(disciplina: disciplina))
            );
          },
        ),
        body: Container(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  '${disciplina.nome}',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              Text('Tempo/ciclo: ${disciplina.tempoCicloFormatado}'),
            ],
          ),
        )));
  }
}
