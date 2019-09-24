import 'dart:async';

import 'package:estuda_que_da/estudo_finalizar.dart';
import 'package:estuda_que_da/model/estudo.dart';
import 'package:estuda_que_da/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EstudoCronometro extends StatefulWidget {
  final Estudo estudo;

  EstudoCronometro({Key key, this.estudo}) : super(key: key);

  @override
  _EstudoCronometroState createState() => _EstudoCronometroState();
}

class _EstudoCronometroState extends State<EstudoCronometro> {
  Duration _tempo = Duration(milliseconds: 0);
  Timer _timer;
  bool contando = true;

  @override
  void initState() {
    super.initState();
    _tempo = DateTime.now().difference(widget.estudo.tempoInicio);
    _iniciaContador();
  }

  void _iniciaContador() => _timer = new Timer.periodic(const Duration(seconds: 1), setTime);
  void _paraContador() => _timer.cancel();

  void setTime(Timer timer) {
    setState(() {
      _tempo = DateTime.now().difference(widget.estudo.tempoInicio);
    });
  }

  @override
  void dispose() {
    _paraContador();
    super.dispose();
  }

  Padding _infoComPadding(String label, String valor, [TextStyle style = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _infoComPadding('Disciplina', '${e.disciplina.nome}'),
            _infoComPadding('Material', '${e.material}'),
            _infoComPadding('Página inicial', '${e.paginaInicial}'),
            _infoComPadding('Início', '${e.tempoInicioFormatado}', TextStyle(fontSize: 24.0)),
            _infoComPadding('Ciclo', '${e.disciplina.tempoCicloFormatado}'),
            _infoComPadding('Fim estimado', '${e.tempoFimEstimadoFormatado}'),
            _infoComPadding(
              'Tempo estudado',
              '${Utils.formatDuration(_tempo)}',
              TextStyle(fontWeight:FontWeight.bold,fontSize: 40.0)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(contando ? Icons.pause : Icons.play_arrow),
                  onPressed: () {
                    setState(() => contando = !contando);
                    if (contando) {
                      _iniciaContador();
                    } else {
                      _paraContador();
                    }
                  },
                )
              ],
            ),
            RaisedButton(
              child: Text('Finalizar estudo'),
              onPressed: contando ? null : () {
                e.tempoFim = DateTime.now();
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => EstudoFinalizar(estudo: e)
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
