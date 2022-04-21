import 'package:flutter/material.dart';

class Responsivo extends StatelessWidget {
  const Responsivo({Key? key}) : super(key: key);

  //Celulares
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  //Tablet
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  //Desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
