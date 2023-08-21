import 'package:flutter/material.dart';
import 'package:ramos_mauro_examen/screens/ramos_mauro_formulario.dart';
import 'package:ramos_mauro_examen/screens/ramos_mauro_login.dart';
import 'package:ramos_mauro_examen/screens/ramos_mauro_mapa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    '/': (context) => const RamosMauroLogin(),
    '/formulario': (context) => const RamosMauroFormulario(),
    '/mapa': (context) => const RamosMauroMapa(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          useMaterial3: true,
        ),
        title: 'Material App',
        initialRoute: '/',
        routes: _routes,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
              builder: (context) => const RamosMauroLogin());
        });
  }
}
