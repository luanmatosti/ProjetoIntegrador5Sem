import 'package:echo_project/endereco.dart';
import 'package:echo_project/home.dart';
import 'package:echo_project/pagamentocartao.dart';
import 'package:echo_project/pedidoconcluido.dart';
import 'package:echo_project/register.dart';
import 'package:echo_project/service.dart';
import 'package:flutter/material.dart';
import 'package:echo_project/login_screen.dart';

class FinalizarScreen extends StatelessWidget {
  TextEditingController usernameCont =
      TextEditingController(text: 'Av. Eusébio Stevaux');
  TextEditingController passwordCont =
      TextEditingController(text: 'Cartão de Crédito - Master Card');
  TextEditingController resumoCont =
      TextEditingController(text: 'Preço: (1 Item) RS 176,90 \n\n teste');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finalizar Pedido'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: usernameCont,
              decoration: InputDecoration(
                labelText: "Endereço",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnderecoScreen()),
                )
              },
              child: new Text('Escolher Endereço de Entrega'),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: passwordCont,
              decoration: InputDecoration(
                labelText: "Método de Pagamento",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagamento()),
                )
              },
              child: new Text('Escolher Método de Pagamento'),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: resumoCont,
              decoration: InputDecoration(
                labelText: "Resumo",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 250,
              //width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PedidoScreen()),
                  )
                },
                child: Text(
                  "Finalizar",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
