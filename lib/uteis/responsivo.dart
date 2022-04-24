import 'package:flutter/material.dart';

class Responsivo extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet; //Permite ser nulo
  final Widget desktop;

  const Responsivo({
    Key? key,
    this.tablet,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

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
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop; //Retorna desktop se a tela for maior que 1200
        } else if (constraints.maxWidth >= 800) {
          Widget? resTablet = this.tablet;
          if (resTablet != null) {
            return resTablet; //Retorna Tablet se a tela for maior que 800
          }
          return this
              .mobile; //Retorna Mobile caso exista um layout, senão, retorna Tablet.
        } else {
          return mobile;
        }
      },
    );
  }
}
