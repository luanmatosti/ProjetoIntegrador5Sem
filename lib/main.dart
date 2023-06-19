import 'package:echo_project/cart.dart';
import 'package:echo_project/finalizar.dart';
import "package:echo_project/endereco.dart";
import 'package:echo_project/home.dart';
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
      title: 'Echo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: LoginScreen(),
    );
  }
}
