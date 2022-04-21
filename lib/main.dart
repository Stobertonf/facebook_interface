import 'package:flutter/material.dart';
import 'package:facebook_interface/pages/home.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';

void main() {
  runApp(MaterialApp(
    title: "Facebook",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: PaletaCores.scaffold,
    ),
    home: Home(),
  ));
}
