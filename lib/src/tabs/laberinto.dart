import 'package:flutter/material.dart';
import 'package:flutter/src/material/dialog.dart';

import 'package:maze/maze.dart';
import 'package:nuestros_ancestros/src/routes/routes.dart';

import 'package:nuestros_ancestros/src/utils/laberinto_datos.dart';

LaberintoDatos laberintoDatosGeneral;


class Laberinto extends StatelessWidget {
  LaberintoDatos laberintoDatos;
  Laberinto({@required this.laberintoDatos});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Laberinto',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Colors.white),
        home: MazeScreen(laberintoDatos: laberintoDatos,));
  }
}

class MazeScreen extends StatefulWidget {
  LaberintoDatos laberintoDatos;
  MazeScreen({@required this.laberintoDatos});
  @override
  _MazeScreenState createState() => _MazeScreenState(laberintoDatos: laberintoDatos);
}

class _MazeScreenState extends State<MazeScreen> {
  LaberintoDatos laberintoDatos;
  _MazeScreenState({@required this.laberintoDatos});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Maze(
                player: MazeItem(
                    laberintoDatos.imagen_personaje,
                    ImageType.network),
                columns: laberintoDatos.columnas,
                rows: laberintoDatos.filas,
                wallThickness: 4.0,
                wallColor: Theme.of(context).primaryColor,
                finish: MazeItem(
                    laberintoDatos.imagen_meta,
                    ImageType.network),
                onFinish:() =>  Navigator.of(context).pushNamed("/"))

                ));
  }
}





