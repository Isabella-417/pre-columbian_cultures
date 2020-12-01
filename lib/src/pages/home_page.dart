import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:nuestros_ancestros/src/models/cultura.dart';
import 'package:nuestros_ancestros/src/models/datos_cultura.dart';
import 'package:nuestros_ancestros/src/providers/menu_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listadoCulturas(snapshot.data, context),
        );
      },
    );
  }


  List<Widget> _listadoCulturas(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones  = [];
    final List<dynamic> data_json = [];

    data.forEach((element) {

      dynamic datos = DatosCultura(
        element["nombre"],
        element["ubicacion"],
        element["gobernante"],
        element["imagen_menu"],
      );

      guardarInformacionCulturas(datos);


      final widgetTemp = ListTile(
        title: Text(element["nombre"]),
        leading: Icon( 
          Icons.account_box, color : Colors.blue
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color : Colors.blue
          ),
          onTap: () {
            Navigator.pushNamed(context, element["ruta"]);

          },
      );
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
