import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:nuestros_ancestros/src/models/datos_cultura.dart';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  Future<List<dynamic>> cargarDatos() async {
    final response =
        await rootBundle.loadString('data/culturas_precolombinas.json');
    Map datosJson = json.decode(response);
    opciones = datosJson["culturas"];
    return opciones;
  }
}

Future<void> guardarInformacionCulturas(DatosCultura jsonData) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(jsonData.nombre, jsonEncode(jsonData.toJson()));
}

Future<String> obtenerInformacionCultura(String nombreCultura) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String culturaStr = await prefs.getString(nombreCultura);
  return culturaStr;
}

final menuProvider = new _MenuProvider();
