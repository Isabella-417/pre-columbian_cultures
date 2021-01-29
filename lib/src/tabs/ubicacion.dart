import 'package:flutter/material.dart';
import 'package:nuestros_ancestros/src/utils/cartas_view.dart';
import 'package:nuestros_ancestros/src/ui/listadoDioses.dart';

class Ubicacion extends StatelessWidget {
  final List<CartasView> datosCultura;
  Ubicacion({@required this.datosCultura});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: listadoDioses(this.datosCultura, context)),
    );
  }
}
