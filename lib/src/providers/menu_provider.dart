import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nuestros_ancestros/src/models/datos_cultura.dart';

class _MenuProvider {

  List<dynamic> opciones = [];

  Future <List<dynamic>> cargarDatos() async {
    final response = await rootBundle.loadString('data/culturas_precolombinas.json');

    Map datosJson = json.decode(response);
    opciones = datosJson["culturas"];
    return opciones;
  }
}


Future<void> guardarInformacionCulturas(DatosCultura jsonData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString(jsonData.nombre, jsonEncode(jsonData.toJson()));
}

Future<DatosCultura> obtenerInformacionCultura(String nombreCultura) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> culturaMap;
    final String culturaStr = prefs.getString(nombreCultura);
    if (culturaStr != null) {
      culturaMap = jsonDecode(culturaStr) as Map<String, dynamic>;
      print(culturaMap);
    }

    if (culturaMap != null) {
      print(culturaMap);
    }
    return null;
  }

final menuProvider  =  new _MenuProvider();