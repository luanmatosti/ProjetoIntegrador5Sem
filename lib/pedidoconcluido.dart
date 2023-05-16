import 'package:echo_project/home.dart';
import 'package:echo_project/pagamentocartao.dart';
import 'package:echo_project/register.dart';
import 'package:echo_project/service.dart';
import 'package:flutter/material.dart';
import 'package:echo_project/login_screen.dart';

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
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            Text("ID: D123456789ABC ",
                style: TextStyle(
                  fontSize: 40.0,
                )),

            /*
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
                labelText: "Data",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: horaCont,
              decoration: InputDecoration(
                labelText: "Horário",
                border: OutlineInputBorder(),
              ),
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
            TextField(
              controller: metodoCont,
              decoration: InputDecoration(
                labelText: "Método de Pagamento",
                border: OutlineInputBorder(),
              ),
            ),

            */
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
