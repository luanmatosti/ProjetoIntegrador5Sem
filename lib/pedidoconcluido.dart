import 'package:flutter/material.dart';

class PedidoScreen extends StatelessWidget {
  TextEditingController idCont = TextEditingController(text: 'D123456789ABC');
  TextEditingController dataCont = TextEditingController(text: '24/02');
  TextEditingController horaCont = TextEditingController(text: '09:41');
  TextEditingController itemCont =
      TextEditingController(text: 'Álbum Blurryface x1');
  TextEditingController precoCont = TextEditingController(text: 'R\$176,90');
  TextEditingController totalCont = TextEditingController(text: 'R\$176,90');
  TextEditingController metodoCont = TextEditingController(text: 'Débito');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recibo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Obrigado",
                style: TextStyle(
                  fontSize: 40.0,
                )),
            Text("Transação bem sucedida!!",
                style: TextStyle(
                  fontSize: 20.0,
                )),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: idCont,
              decoration: InputDecoration(
                labelText: "Id da transação",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: dataCont,
              decoration: InputDecoration(
                labelText: "Data e Hora",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text("Item",
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: itemCont,
              decoration: InputDecoration(
                labelText: "Item",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: precoCont,
              decoration: InputDecoration(
                labelText: "Preço",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: totalCont,
              decoration: InputDecoration(
                labelText: "Total",
                border: OutlineInputBorder(),
              ),
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
