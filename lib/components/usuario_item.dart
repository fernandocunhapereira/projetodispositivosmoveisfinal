import 'package:flutter/material.dart';

import '../models/usuario.dart';

class UsuarioItem extends StatelessWidget {
  final Usuario usuario;

  const UsuarioItem(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            usuario.nome,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
