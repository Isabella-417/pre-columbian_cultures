import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuestros_ancestros/src/tabs/dioses.dart';
import 'package:nuestros_ancestros/src/tabs/laberinto.dart';
import 'package:nuestros_ancestros/src/tabs/estructura_social.dart';
import 'package:nuestros_ancestros/src/tabs/ubicacion.dart';
import 'package:nuestros_ancestros/src/utils/cartas_view.dart';
import 'package:nuestros_ancestros/src/utils/laberinto_datos.dart';
import 'package:nuestros_ancestros/src/utils/organizar_datos.dart';

class AztecasPage extends StatelessWidget {
  final Future<String> datosCultura;
  AztecasPage({this.datosCultura}); //@required

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Sociedad", icon: Icon(Icons.people)),
                Tab(text: "Dios", icon: Icon(Icons.wb_sunny)),
                Tab(text: "Lugar", icon: Icon(Icons.location_on_rounded)),
                Tab(text: "Reto", icon: Icon(Icons.videogame_asset_rounded)),
              ],
            ),
            title: Text('Cultura Azteca'),
          ),
          body: FutureBuilder(
              future: datosCultura,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  Map<dynamic, dynamic> datos = jsonDecode(snapshot.data)["dioses"];
                  List<CartasView> dioses  = organizarDatosDioses(datos);

                  Map<dynamic, dynamic> datosSocial = jsonDecode(snapshot.data)["sociedad"];
                  List<CartasView> sociedad  = organizarDatosSociedad(datosSocial);


                  Map<dynamic, dynamic> datosUbicacion = jsonDecode(snapshot.data)["ubicacion"];
                  List<CartasView> ubicacion  = organizarDatosUbicacion(datosUbicacion);

                  Map<dynamic, dynamic> datosLaberinto = jsonDecode(snapshot.data)["laberinto"];
                  LaberintoDatos laberinto =  organizarDatosLaberinto(datosLaberinto);

                  return TabBarView(
                    children: [EstructuraSocial(datosCultura: sociedad), Dioses(datosCultura: dioses), Ubicacion(datosCultura: ubicacion),  Laberinto(laberintoDatos: laberinto,)],
                  );
                }
              })),
    ));
  }
}