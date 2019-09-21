import 'package:estuda_que_da/model/disciplina.dart';
import 'package:flutter/material.dart';

class DisciplinaCreate extends StatelessWidget {
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome da disciplina',
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    var form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      _disciplina.save();
                      Navigator.pop<Disciplina>(context, _disciplina);
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
