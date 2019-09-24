import 'package:estuda_que_da/model/disciplina.dart';
import 'package:flutter/material.dart';

class DisciplinaCriar extends StatefulWidget {
  @override
  _DisciplinaCriarState createState() => _DisciplinaCriarState();
}

class _DisciplinaCriarState extends State<DisciplinaCriar> {
  final _formKey = GlobalKey<FormState>();
  Disciplina _disciplina = new Disciplina();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Disciplina'),
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
              onSaved: (String value) {
                _disciplina.nome = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            RaisedButton(
              child: Text('Cadstrar'),
              onPressed: () {
                var form = _formKey.currentState;
                if (form.validate()) {
                  form.save();
                  _disciplina.save();
                  Navigator.pop<Disciplina>(context, _disciplina);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

