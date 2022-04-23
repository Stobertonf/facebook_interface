import '../uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavegacaoAbas extends StatelessWidget {
  final List<IconData> icones;
  final bool indicadorEmbaixo;
  final int indiceAbaSelecionada;
  final Function(int) onTap;

  const NavegacaoAbas({
    Key? key,
    required this.icones,
    this.indicadorEmbaixo = false,
    required this.indiceAbaSelecionada,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTap,
        indicator: BoxDecoration(
          border: indicadorEmbaixo
              ? const Border(
                  bottom: BorderSide(
                    color: PaletaCores.azulFacebook,
                    width: 3,
                  ),
                )
              : const Border(
                  top: BorderSide(
                    color: PaletaCores.azulFacebook,
                    width: 3,
                  ),
                ),
        ),
        tabs: icones
            .asMap()
            .map((indice, icone) {
              return MapEntry(
                  indice,
                  Tab(
                    icon: Icon(
                      icone,
                      size: 30,
                      color: indiceAbaSelecionada == indice
                          ? PaletaCores.azulFacebook
                          : Colors.grey,
                    ),
                  ));
            })
            .values
            .toList());
  }
}
