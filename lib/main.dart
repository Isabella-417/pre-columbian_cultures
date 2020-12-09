import 'package:flutter/material.dart';

import 'package:nuestros_ancestros/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuestros ancestros',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: getAppRoutes(),
    );
  }
}
