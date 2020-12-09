import 'package:flutter/material.dart';
import 'package:nuestros_ancestros/src/utils/cartas_view.dart';

class EstructuraSocial extends StatelessWidget {
  final List<CartasView> datosCultura;
  EstructuraSocial({@required this.datosCultura});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: _listadoDioses(this.datosCultura, context)),
    );
  }

  List<Widget> _listadoDioses(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((element) {
      final widgetTemp = Card(
          child: Column(children: <Widget>[
        Container(
          height: 144.0,
          width: 400.0,
          child: Image.network(element.imagenUrl, height: 144.0, width: 160.0),
        ),
        padding(Text(
          element.nombre,
          style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
        )),
        Column(
          children: [
            padding(
              Text(
                element.descripcion,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            padding(
              Text(
                element.otros,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ],
        ),
      ]));
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }

  Widget padding(Widget widget) {
    return Padding(padding: EdgeInsets.all(12.0), child: widget);
  }
}
