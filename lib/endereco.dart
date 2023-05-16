import 'package:flutter/material.dart';

class EnderecoScreen extends StatelessWidget {
  TextEditingController LogradouroCont =
      TextEditingController(text: 'Av. Eusébio Stevaux');
  TextEditingController nroCont = TextEditingController(text: '823');
  TextEditingController cepCont = TextEditingController(text: '04447011');
  TextEditingController refeCont =
      TextEditingController(text: 'Próximo ao roldão');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Endereço'),
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
              controller: LogradouroCont,
              decoration: InputDecoration(
                labelText: "Logradouro",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: nroCont,
              decoration: InputDecoration(
                labelText: "Número",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Complemento",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: cepCont,
              decoration: InputDecoration(
                labelText: "CEP",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: refeCont,
              decoration: InputDecoration(
                labelText: "Referência",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
