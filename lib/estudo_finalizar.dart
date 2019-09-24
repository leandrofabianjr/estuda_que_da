import 'package:estuda_que_da/model/estudo.dart';
import 'package:flutter/material.dart';

class EstudoFinalizar extends StatefulWidget {
  Estudo estudo;

  EstudoFinalizar({Key key, @required this.estudo}) : super(key: key);

  @override
  _EstudoFinalizarState createState() => _EstudoFinalizarState();
}

class _EstudoFinalizarState extends State<EstudoFinalizar> {
  var _formKey = GlobalKey<FormState>();

  Padding _infoComPadding(String label, String valor,
      [TextStyle style =
          const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('$label:'),
          Text('$valor', style: style),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var e = widget.estudo;
    return Scaffold(
      appBar: AppBar(
        title: Text('Finalizar estudo'),
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            _infoComPadding('Disciplina', '${e.disciplina.nome}'),
            _infoComPadding('Material', '${e.material}'),
            _infoComPadding('Página inicial', '${e.paginaInicial}'),
            _infoComPadding('Tempo estudado', '${e.tempoEstudadoFormatado}'),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Página final',
              ),
              validator: (val) => val.isEmpty ? 'Campo obrigatório' : null,
              onSaved: (val) => e.paginaFinal = int.parse(val),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Observações'),
              validator: (val) => val.isEmpty ? 'Campo obrigatório' : null,
              onSaved: (val) => e.observacao = val,
            ),
            RaisedButton(
              child: Text('Salvar'),
              onPressed: () {
                var form = _formKey.currentState;
                if (form.validate()) {
                  form.save();
                  e.save();
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
