import 'package:estuda_que_da/model/disciplina.dart';
import 'package:flutter/material.dart';

class EstudoListar extends StatefulWidget {
  final Disciplina disciplina;

  EstudoListar({Key key, @required this.disciplina}) : super(key:key);

  @override
  _EstudoListarState createState() => _EstudoListarState();
}

class _EstudoListarState extends State<EstudoListar> {
  var _keyScaffold = GlobalKey<ScaffoldState>();

  List<Widget> _montaTilesEstudos() {
    print('a');
    Iterable<ListTile> tiles = widget.disciplina.getEstudos().map(
      (e) => ListTile(
        title: Text('${e.material}'),
        subtitle: Text('${e.tempoInicioFormatado}'),
        trailing: Text('${e.tempoEstudadoFormatado}'),
      )
    );
    return tiles.toList();
    return ListTile.divideTiles(context: _keyScaffold.currentContext, tiles: tiles).toList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        title: Text('Estudos'),
      ),
      body: ListView(
        children: _montaTilesEstudos(),
      ),
    );
  }

}
