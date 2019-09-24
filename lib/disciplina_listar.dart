import 'package:estuda_que_da/disciplina_criar.dart';
import 'package:estuda_que_da/disciplina_detalhe.dart';
import 'package:estuda_que_da/model/disciplina.dart';
import 'package:flutter/material.dart';

class DisciplinaListar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disciplinas'),
      ),
      body: Container(
        child: Listagem()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var d = await Navigator.push<Disciplina>(
            context,
            MaterialPageRoute(builder: (context) => DisciplinaCriar()),
          );
          print('${d.id} - ${d.nome}');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Listagem extends StatefulWidget {
  @override
  _ListagemState createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: _buildTiles(context)),
    );
  }

  List<Widget> _buildTiles(BuildContext context) {

    Iterable<ListTile> tiles = Disciplina.getDisciplinas().map((Disciplina d) {
//      print('aa');
      return ListTile(
        title: Text('${d.id} - ${d.nome}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DisciplinaDetalhe(disciplina: d)),
          );
//          Scaffold.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text('${nova.id} - ${nova.nome}')));
        },
      );
    });

    return ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
  }
}

