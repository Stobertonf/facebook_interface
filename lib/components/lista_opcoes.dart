import 'package:facebook_interface/components/botao_imagem_perfil.dart';

import '../models/usuario.dart';
import '../uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListaOpcoes extends StatelessWidget {
  final Usuario usuario;

  //List item = _opcoes[0];
  //Item[1]

  final List<List> _opcoes = const [
    [LineIcons.userFriends, PaletaCores.azulFacebook, "Amigos"],
    [LineIcons.facebookMessenger, PaletaCores.azulFacebook, 'Mensagens'],
    [LineIcons.flag, Colors.orange, 'Páginas'],
    [LineIcons.user, PaletaCores.azulFacebook, 'Grupos'],
    [Icons.storefront_outlined, PaletaCores.azulFacebook, 'Marketplace'],
    [Icons.ondemand_video, Colors.red, 'Assistir'],
    [LineIcons.calendar, Colors.deepPurple, "AmigosEventos"],
    [LineIcons.chevronCircleDown, Colors.black45, "Ver Mais"],
  ];

  const ListaOpcoes({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: 1 + _opcoes.length,
        itemBuilder: ((context, indice) {
          if (indice == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
              ),
              child: BotaoImagemPerfil(
                usuario: usuario,
                onTap: () {},
              ),
            );
          }

          List item = _opcoes[indice - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
            ),
            child: Container(),
          );
        }),
      ),
    );
  }
}

class Opoes extends StatelessWidget {
  final Color cor;
  final String texto;
  final IconData icone;
  final VoidCallback onTap;

  const Opoes({
    Key? key,
    required this.cor,
    required this.icone,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, color: cor, size: 35),
          const SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
