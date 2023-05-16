import 'package:echo_project/finalizar.dart';
import 'package:echo_project/pagamentocartao.dart';
import "package:echo_project/endereco.dart";
import 'package:echo_project/login_screen.dart';
import 'package:echo_project/pedidoconcluido.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: FinalizarScreen(),
    );
  }
}
