import 'package:flutter/material.dart';
import 'package:nuestros_ancestros/src/utils/organizar_datos.dart';

class CulturePage extends StatelessWidget {
  final Future<String> datosCultura;
  CulturePage({this.datosCultura}); //@required

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
                    Tab(
                        text: "Reto",
                        icon: Icon(Icons.videogame_asset_rounded)),
                  ],
                ),
                title: Text('Cultura'),
              ),
              body: FutureBuilder(
                  future: datosCultura,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      List informacionCultura =
                          organizarInformacionCultura(snapshot);
                      return TabBarView(children: informacionCultura);
                    }
                  })),
        ));
  }
}
