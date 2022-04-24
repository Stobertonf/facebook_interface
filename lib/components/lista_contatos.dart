import '../models/usuario.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  final List<Usuario> usuarios;

  const ListaContatos({
    Key? key,
    required this.usuarios,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Contatos",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.video_call),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
