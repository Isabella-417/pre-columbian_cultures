import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {

  List<dynamic> opciones = [];

  Future <List<dynamic>> cargarDatos() async {
    final response = await rootBundle.loadString('data/culturas_precolombinas.json');

    Map datosJson = json.decode(response);
    opciones = datosJson["culturas"];
    print(opciones);

    return opciones;
  }
}

final menuProvider  =  new _MenuProvider();