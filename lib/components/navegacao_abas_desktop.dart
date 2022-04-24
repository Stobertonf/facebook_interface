import 'botao_circulo.dart';
import 'navegacao_abas.dart';
import '../models/usuario.dart';
import '../uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:facebook_interface/components/botao_imagem_perfil.dart';

class NavegacaoAbasDesktop extends StatelessWidget {
  final Usuario usuario;
  final Function(int) onTap;
  final List<IconData> icones;
  final int indiceAbaSelecionada;

  const NavegacaoAbasDesktop({
    Key? key,
    required this.onTap,
    required this.icones,
    required this.usuario,
    required this.indiceAbaSelecionada,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Facebook - Desktop",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Expanded(
            child: NavegacaoAbas(
              icones: icones,
              onTap: onTap,
              indicadorEmbaixo: true,
              indiceAbaSelecionada: indiceAbaSelecionada,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BotaoImagemPerfil(
                  usuario: usuario,
                  onTap: () {},
                ),
                BotaoCirculo(
                  icone: Icons.search,
                  iconeTamanho: 30,
                  onPressed: () {},
                ),
                BotaoCirculo(
                  icone: LineIcons.facebookMessenger,
                  iconeTamanho: 30,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
