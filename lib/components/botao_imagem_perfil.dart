import 'package:facebook_interface/components/imagem_perfil.dart';

import '../models/usuario.dart';
import 'package:flutter/material.dart';

class BotaoImagemPerfil extends StatelessWidget {
  final Usuario usuario;
  final VoidCallback onTap;

  const BotaoImagemPerfil({
    Key? key,
    required this.usuario,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Row(
          children: [
            ImagemPerfil(
              urlImagem: usuario.urlImagem,
              foiVisualizado: true,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              usuario.nome,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ));
  }
}
