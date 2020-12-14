import 'package:flutter/material.dart';

import 'package:nuestros_ancestros/src/models/datos_cultura.dart';
import 'package:nuestros_ancestros/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuestros ancestros'),
      ),
      body: _generarListadoCulturas(),
    );
  }

  Widget _generarListadoCulturas() {
    return FutureBuilder(
      future: menuProvider.cargarDatos(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listadoCulturas(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listadoCulturas(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    if (data != null){
    data.forEach((element) {
      guardarInformacionCulturas(DatosCultura(
        element["nombre"],
        element["tablero"]["ubicacion"],
        element["tablero"]["sociedad"],
        element["tablero"]["dioses"],
        element["imagen_menu"],
        element["tablero"]["laberinto"]
      ));

      final widgetTemp = ListTile(
        title: Text(element["nombre"]),
        leading: Image.network(element["imagen_menu"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, element["ruta"]);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });}

    return opciones;
  }
}
