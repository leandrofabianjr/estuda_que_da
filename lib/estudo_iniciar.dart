import 'package:estuda_que_da/estudo_cronometro.dart';
import 'package:estuda_que_da/model/disciplina.dart';
import 'package:flutter/material.dart';

import 'model/estudo.dart';

class EstudoIniciar extends StatefulWidget {
  final Disciplina disciplina;

  EstudoIniciar({Key key, @required this.disciplina}) : super(key: key);

  @override
  _EstudoIniciarState createState() => _EstudoIniciarState(disciplina);
}

class _EstudoIniciarState extends State<EstudoIniciar> {
  Disciplina disciplina;
  var _formKey = new GlobalKey<FormState>();
  Estudo _estudo = new Estudo();

  _EstudoIniciarState(this.disciplina);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar estudo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Disciplina:'),
              Text('${disciplina.nome}', style: TextStyle(fontSize: 24.0)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Material'),
                validator: validaCampoObrigatorio,
                onSaved: (val) => _estudo.material = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Página inicial'),
                keyboardType: TextInputType.number,
                validator: validaCampoObrigatorio,
                onSaved: (val) => _estudo.paginaInicial = int.parse(val),
              ),
              RaisedButton(
                child: Text('Bora estudar!'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _estudo.tempoInicio = DateTime.now();
                    _estudo.idDisciplina = disciplina.id;
                    _estudo.disciplina = disciplina;
                    _estudo.save();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EstudoCronometro(estudo: _estudo)));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String validaCampoObrigatorio(String val) {
    if (val.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
