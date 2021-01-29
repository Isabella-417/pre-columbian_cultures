import 'dart:convert';

import 'package:nuestros_ancestros/src/utils/cartas_view.dart';
import 'package:nuestros_ancestros/src/utils/laberinto_datos.dart';

import 'package:nuestros_ancestros/src/tabs/estructura_social.dart';
import 'package:nuestros_ancestros/src/tabs/dioses.dart';
import 'package:nuestros_ancestros/src/tabs/ubicacion.dart';
import 'package:nuestros_ancestros/src/tabs/laberinto.dart';

organizarInformacionCultura(snapshot) {
  Map<dynamic, dynamic> datos = jsonDecode(snapshot.data)["dioses"];
  List<CartasView> dioses = organizarDatosDioses(datos);

  Map<dynamic, dynamic> datosSocial = jsonDecode(snapshot.data)["sociedad"];
  List<CartasView> sociedad = organizarDatosSociedad(datosSocial);

  Map<dynamic, dynamic> datosUbicacion = jsonDecode(snapshot.data)["ubicacion"];
  List<CartasView> ubicacion = organizarDatosUbicacion(datosUbicacion);

  Map<dynamic, dynamic> datosLaberinto = jsonDecode(snapshot.data)["laberinto"];
  LaberintoDatos laberinto = organizarDatosLaberinto(datosLaberinto);

  return [
    EstructuraSocial(datosCultura: sociedad),
    Dioses(datosCultura: dioses),
    Ubicacion(datosCultura: ubicacion),
    Laberinto(
      laberintoDatos: laberinto,
    )
  ];
}

organizarDatosDioses(Map<dynamic, dynamic> informacion) {
  List<CartasView> cards = [];

  informacion["lista_dioses"].forEach((key, value) {
    CartasView card = CartasView(
        key,
        informacion["lista_dioses"][key]["detalle"],
        informacion["lista_dioses"][key]["imagen"],
        "");

    cards.add(card);
  });

  cards.add(CartasView(informacion["mito"]["nombre"],
      informacion["mito"]["detalle"], informacion["mito"]["imagen"], ""));
  return cards;
}

organizarDatosSociedad(Map<dynamic, dynamic> informacion) {
  List<CartasView> cards = [];

  cards.add(CartasView(
      informacion["introduccion"]["nombre"],
      informacion["introduccion"]["detalle"],
      informacion["introduccion"]["imagen"],
      ""));

  informacion["clases_sociales"].forEach((key, value) {
    CartasView card = CartasView(
      key,
      informacion["clases_sociales"][key]["detalle"],
      informacion["clases_sociales"][key]["imagen"],
      informacion["clases_sociales"][key]["vestimenta"],
    );
    cards.add(card);
  });

  return cards;
}

organizarDatosLaberinto(Map<dynamic, dynamic> informacion) {
  return new LaberintoDatos(
      informacion["imagen_personaje"],
      informacion["imagen_meta"],
      informacion["filas"],
      informacion["columnas"],
      informacion["mensaje_meta"]);
}

organizarDatosUbicacion(Map<dynamic, dynamic> informacion) {
  List<CartasView> cards = [];

  cards.add(CartasView(
      informacion["gobernante"]["nombre"],
      informacion["gobernante"]["detalle"],
      informacion["gobernante"]["imagen"],
      ""));

  cards.add(CartasView(
      informacion["ubicacion"]["nombre"],
      informacion["ubicacion"]["detalle"],
      informacion["ubicacion"]["imagen"],
      ""));

  informacion["organizacion_territorial"].forEach((key, value) {
    CartasView card = CartasView(
      key,
      informacion["organizacion_territorial"][key]["detalle"],
      informacion["organizacion_territorial"][key]["imagen"],
      "",
    );
    cards.add(card);
  });

  return cards;
}
