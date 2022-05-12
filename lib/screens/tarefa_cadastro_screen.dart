import 'package:flutter/material.dart';
import '../models/tarefa.dart';
import '../models/usuario.dart';
import '../models/projeto.dart';
import '../data/globals.dart' as globals;

class TarefaCadastroScreen extends StatefulWidget {
  @override
  State<TarefaCadastroScreen> createState() => _TarefaCadastroScreenState();
}

class _TarefaCadastroScreenState extends State<TarefaCadastroScreen> {
  final _tarefaControllerDescricao = TextEditingController();

  Usuario _usuario = Usuario(id: 0, nome: '', email: '');
  _selecionarUsuario() {
    
  }

  @override
  Widget build(BuildContext context) {
    final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Tarefa'),
      ),
      body: Column(children: <Widget>[
        Card(
          shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            color: Color.fromARGB(255, 238, 229, 248),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _tarefaControllerDescricao,
                  decoration: InputDecoration(
                    labelText: 'Descricao da tarefa',
                    border: OutlineInputBorder(),
                    ),
                ),
              )
            ]
          )
        ),
        Divider(
            height: 20,
          ),
        
        Card(
          shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            color: Color.fromARGB(255, 238, 229, 248),
          child: 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Atribua um usuario a tarefa:')
            )
        ),

        Expanded(
          child: SizedBox(
            height: 200.0,
            child: GestureDetector(
              onTap: () {
                _selecionarUsuario;
                print('clicou');
              },
              child: ListView.builder(
                itemCount: globals.listaUsuariosGlobal.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(globals.listaUsuariosGlobal[index].nome),
                        subtitle:
                            Text(globals.listaUsuariosGlobal[index].email),
                        onTap: () {
                          setState(() {
                            _usuario = globals.listaUsuariosGlobal[index];
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Text('Usuario selecionado: ' + _usuario.nome),

        ElevatedButton(
            onPressed: () => salvarTarefa(projeto.id, _usuario),
            child: Text('Salvar')
          )
      ]
      ),
    );
  }

  salvarTarefa(int id, Usuario _usuarioId) {
    Tarefa novaTarefa = Tarefa(
        id: id, descricao: _tarefaControllerDescricao.text, usuario: _usuario
        );
    Navigator.pop(context, novaTarefa);
  }
}
