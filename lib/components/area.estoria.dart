import '../uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/imagem_perfil.dart';

class AreaStoria extends StatelessWidget {
  final Usuario usuario;
  final List<Story> stories;

  const AreaStoria({
    Key? key,
    required this.usuario,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, indice) {
            if (indice == 0) {
              Story EstoriaUsuario = Story(
                usuario: usuarioAtual,
                urlImagem: usuarioAtual.urlImagem,
              );

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: CartaoEstoria(
                  adicionarStory: true,
                  story: EstoriaUsuario,
                ),
              );
            }

            Story story = stories[indice - 1];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CartaoEstoria(
                story: story,
              ),
            );
          }),
    );
  }
}

class CartaoEstoria extends StatelessWidget {
  final Story story;
  final bool adicionarStory;
  const CartaoEstoria({
    Key? key,
    required this.story,
    this.adicionarStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          //Preciso rever
          //borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.degradeEstoria,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: adicionarStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: PaletaCores.azulFacebook,
                    onPressed: () {},
                  ),
                )
              : ImagemPerfil(
                  urlImagem: story.usuario.urlImagem,
                  foiVisualizado: story.foiVisualizado,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            adicionarStory ? "Criar Story" : story.usuario.nome,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
