import 'package:echo_project/service.dart';
import 'package:flutter/material.dart';

class PedidoScreen extends StatelessWidget {
  TextEditingController idCont = TextEditingController(text: 'D123456789ABC');
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
          child: FutureBuilder(
            future: ApiService().getBuy(),
            // ignore: missing_return
            builder: (context, snapshot) {
              print(snapshot.data);
              return Column(
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
                  Text("ID: " + snapshot.data['idCompra'].toString(),
                      style: TextStyle(
                        fontSize: 40.0,
                      )),
                ],
              );
            },
          ),
        ));
  }
}
