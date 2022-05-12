import 'package:flutter/material.dart';

import '../components/tarefa_item.dart';
import '../data/my_data.dart';
import '../models/projeto.dart';
import '../models/tarefa.dart';
import '../utils/app_routes.dart';

class ProjetoDetalheScreen extends StatefulWidget {
  @override
  State<ProjetoDetalheScreen> createState() => _ProjetoDetalheScreenState();
}

class _ProjetoDetalheScreenState extends State<ProjetoDetalheScreen> {
  @override
  Widget build(BuildContext context) {

    final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;

    List<Tarefa> tarefaItem = DUMMY_TAREFAS.where((tarefas) {
      return tarefas.id == projeto.id;
    }).toList();

    cadastrarTarefa() async {
      var result = await Navigator.pushNamed(context, AppRoutes.TAREFA_CADASTRO,
          arguments: projeto);
      if (result != null) {
        setState(() {
          DUMMY_TAREFAS.add(result as Tarefa);
          tarefaItem = DUMMY_TAREFAS.where((tarefas) {
            return tarefas.id == projeto.id;
          }).toList();
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(projeto.titulo),
      ),
      body:
          Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              projeto.descricao,
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: ListView.builder(
                  itemCount: tarefaItem.length,
                  itemBuilder: (ctx, index) {
                    return TarefaItem(tarefaItem[index]);
                  },
                ),
              ),
            ),
            ElevatedButton(
                onPressed: cadastrarTarefa, child: Text('Cadastrar Tarefa')
              )
          ],
        ),
      ),
    );
  }
}
