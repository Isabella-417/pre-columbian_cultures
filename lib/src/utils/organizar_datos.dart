import 'package:nuestros_ancestros/src/utils/cartas_view.dart';

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
