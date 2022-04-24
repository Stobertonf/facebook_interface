import '../dados/dados.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../components/navegacao_abas_desktop.dart';
import 'package:facebook_interface/pages/home.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:facebook_interface/components/navegacao_abas.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Widget> _telas = [
    const Home(),
    const Scaffold(
      backgroundColor: Colors.blue,
    ),
    const Scaffold(
      backgroundColor: Colors.black,
    ),
    const Scaffold(
      backgroundColor: Colors.red,
    ),
    const Scaffold(
      backgroundColor: Colors.yellow,
    ),
    const Scaffold(
      backgroundColor: Colors.purple,
    ),
  ];

  List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];
  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsivo.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                preferredSize: Size(tamanho.width, 65),
                child: NavegacaoAbasDesktop(
                  icones: _icones,
                  usuario: usuarioAtual,
                  indiceAbaSelecionada: _indiceAbaSelecionada,
                  onTap: (indice) {
                    setState(() {
                      _indiceAbaSelecionada = indice;
                    });
                  },
                ),
              )
            : null,
        body: TabBarView(
          //Removendo navegação de clicar e arrastar para o lado.
          physics: const NeverScrollableScrollPhysics(),
          children: _telas,
        ),
        bottomNavigationBar: isDesktop
            ? null
            : NavegacaoAbas(
                icones: _icones,
                indiceAbaSelecionada: _indiceAbaSelecionada,
                onTap: (indice) {
                  setState(() {
                    _indiceAbaSelecionada = indice;
                  });
                }),
      ),
    );
  }
}
