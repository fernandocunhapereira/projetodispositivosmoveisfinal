import 'package:flutter/material.dart';
import '../models/projeto.dart';
import '../utils/app_routes.dart';

class ProjetoItem extends StatelessWidget {
  final Projeto projeto;

  const ProjetoItem(this.projeto);

  void _selectedProjeto(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.PROJETO_DETALHE,
      arguments: projeto,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedProjeto(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          projeto.titulo,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
