import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/models/postagem.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/components/area.estoria.dart';
import 'package:facebook_interface/components/botao_circulo.dart';
import 'package:facebook_interface/components/area_criar_postagem.dart';

import '../components/cartao..postagem.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          //expandedHeight: 250,
          floating: true, //Deixa a barra flutuante
          centerTitle: false,
          title: const Text(
            "Facebook - M",
            style: TextStyle(
              color: PaletaCores.azulFacebook,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
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
        SliverToBoxAdapter(
          child: AreaCriarPostagem(usuario: usuarioAtual),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaStoria(
              usuario: usuarioAtual,
              stories: storys,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, indece) {
            Postagem postagem = postagens[indece];
            return CartaoPostagem(postagem: postagem);
          },
          childCount: postagens.length,
        )),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            height: 2000,
          ),
        ),
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          //expandedHeight: 250,
          floating: true, //Deixa a barra flutuante
          centerTitle: false,
          title: const Text(
            "Facebook - D",
            style: TextStyle(
              color: PaletaCores.azulFacebook,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
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
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaStoria(
              usuario: usuarioAtual,
              stories: storys,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: AreaCriarPostagem(usuario: usuarioAtual),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, indece) {
            Postagem postagem = postagens[indece];
            return CartaoPostagem(postagem: postagem);
          },
          childCount: postagens.length,
        )),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            height: 2000,
          ),
        ),
      ],
    );
  }
}
