import 'package:flutter/material.dart';

import 'package:nuestros_ancestros/src/pages/aztecas_page.dart';
import 'package:nuestros_ancestros/src/pages/home_page.dart';
import 'package:nuestros_ancestros/src/pages/incas_page.dart';
import 'package:nuestros_ancestros/src/pages/mayas_page.dart';


Map<String, WidgetBuilder> getAppRoutes(){
   return  <String, WidgetBuilder>{
       '/': (BuildContext context) => HomePage(),
       'mayas': (BuildContext context) => MayasPage(),
       'incas': (BuildContext context) => IncasPage(),
       'aztecas': (BuildContext context) => AztecasPage()
       };
}
