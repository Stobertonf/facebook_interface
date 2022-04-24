import '../models/postagem.dart';
import '../uteis/responsivo.dart';
import '../uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/imagem_perfil.dart';

class CartaoPostagem extends StatelessWidget {
  final Postagem postagem;
  const CartaoPostagem({Key? key, required this.postagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: isDesktop ? 5 : 0,
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: <Widget>[
            //Cabeçalho
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CabecalhoPostagem(postagem: postagem),
                  //Cabeçalho
                  Text(
                    postagem.descricao,
                  ),
                  //Descrição
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(
                imageUrl: postagem.urlImagem,
              ),
            ),
            //Imagem Postagem
            //Area de estáticas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: EstaticasPostagem(
                postagem: postagem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Estati
class EstaticasPostagem extends StatelessWidget {
  final Postagem postagem;

  const EstaticasPostagem({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: PaletaCores.azulFacebook,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            //Expandindo até  o tamanho total disponível
            Expanded(
              child: Text(
                "${postagem.curtidas}", //Curtidas
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Text(
              "${postagem.comentarios}", //Comentários
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "${postagem.compartilhamentos}", //Compartilhamentos
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1.2,
        ),
        Row(
          children: [
            BotaoPostagem(
              icone: Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey[700],
              ),
              texto: "Curtir",
              onTap: () {},
            ),
            BotaoPostagem(
              icone: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              texto: "Comentar",
              onTap: () {},
            ),
            BotaoPostagem(
              icone: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              texto: "Compartilhar",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class BotaoPostagem extends StatelessWidget {
  final Icon icone;
  final String texto;
  final VoidCallback onTap;

  const BotaoPostagem({
    Key? key,
    required this.icone,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Interface
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: Row(
              children: [
                icone,
                const SizedBox(
                  width: 4,
                ),
                Text(
                  texto,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CabecalhoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CabecalhoPostagem({Key? key, required this.postagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          urlImagem: postagem.usuario.urlImagem,
          foiVisualizado: true,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postagem.usuario.nome,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "${postagem.tempoAtras} -",
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
          ),
        ),
      ],
    );
  }
}
