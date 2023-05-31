import 'package:echo_project/home.dart';
import 'package:echo_project/pedidoconcluido.dart';
import 'package:echo_project/service.dart';
import 'package:flutter/material.dart';

class FinalizarScreen extends StatelessWidget {
  TextEditingController ruaCont = TextEditingController();
  TextEditingController numeroCont = TextEditingController();
  TextEditingController referenciaCont = TextEditingController();
  TextEditingController cepCont = TextEditingController();
  TextEditingController numeroCartaoCont = TextEditingController();
  TextEditingController dataValidadeCont = TextEditingController();
  TextEditingController codigoSegurancaCont = TextEditingController();
  TextEditingController nomeCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Home();
                }))),
        title: Text('Finalizar Pedido'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: ruaCont,
              decoration: InputDecoration(
                labelText: "Endereço",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: numeroCont,
              decoration: InputDecoration(
                labelText: "Numero do cartão",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: referenciaCont,
              decoration: InputDecoration(
                labelText: "Referencia",
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
              controller: numeroCartaoCont,
              decoration: InputDecoration(
                labelText: "Resumo",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: dataValidadeCont,
              decoration: InputDecoration(
                labelText: "data de validade",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: codigoSegurancaCont,
              decoration: InputDecoration(
                labelText: "CVV",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: nomeCont,
              decoration: InputDecoration(
                labelText: "Nome completo",
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
                onPressed: () async {
                  final String rua = ruaCont.text;
                  final String numero = numeroCont.text;
                  final String referencia = referenciaCont.text;
                  final String cep = cepCont.text;
                  final String numeroCartao = numeroCartaoCont.text;
                  final String dataValidade = dataValidadeCont.text;
                  final String codigoSeguranca = codigoSegurancaCont.text;
                  final String nome = nomeCont.text;

                  final Endereco newEndereco =
                      Endereco(rua, numero, referencia, cep);

                  InformacoesPagamento newInformacoesPagamento =
                      InformacoesPagamento(
                          numeroCartao, dataValidade, codigoSeguranca, nome);
                  FinalizarCompra newFinalizarCompra = FinalizarCompra(
                      100, newEndereco, newInformacoesPagamento);

                  final stats =
                      await ApiService().finishBuy(newFinalizarCompra);

                  if (stats != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Compra realizada! ^^')));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PedidoScreen()),
                    );
                  }
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
