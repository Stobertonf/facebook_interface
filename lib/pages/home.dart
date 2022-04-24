import '../uteis/responsivo.dart';
import 'package:flutter/material.dart';
import '../components/lista_contatos.dart';
import 'package:line_icons/line_icons.dart';
import '../components/cartao..postagem.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/models/postagem.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/components/lista_opcoes.dart';
import 'package:facebook_interface/components/area.estoria.dart';
import 'package:facebook_interface/components/botao_circulo.dart';
import 'package:facebook_interface/components/area_criar_postagem.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Faz o controle do Scroll automaticamente.
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //Fechando o teclado automaticamente
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsivo(
          mobile: HomeMobile(scrollController: _scrollController),
          desktop: HomeDesktop(scrollController: _scrollController),
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeMobile({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          //expandedHeight: 250,
          floating: true, //Deixa a barra flutuante
          centerTitle: false,
          //Mobile
          title: const Text(
            "Facebook",
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
  final TrackingScrollController scrollController;

  const HomeDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListaOpcoes(
              usuario: usuarioAtual,
            ),
          ),
        ),
        const Spacer(), //Coloca espaçamento entre os Flexibles.
        Flexible(
          flex: 5,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
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
              /*  SliverToBoxAdapter(
                child: Container(
                  color: Colors.grey[700],
                  height: 2000,
                ),
              ),*/
            ],
          ),
        ),
        Spacer(),
        Flexible(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ListaContatos(
              usuarios: usuariosOnline,
            ),
          ),
        ),
      ],
    );
  }
}
