import 'package:echo_project/finalizar.dart';
import 'package:flutter/material.dart';

import 'CheckoutScreen.dart';
import 'ProductModel.dart';
import 'ProductScreen.dart';

class CartApp extends StatefulWidget {
  @override
  _CartAppState createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<ProductModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carrinho"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Produtos",
              ),
              Tab(
                text: "Checkout",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct) {
              setState(() {
                cart.add(selectedProduct);
                sum = 0;
                cart.forEach((item) {
                  sum = sum + item.price;
                });
              });
            }, (removedProduct) {
              setState(() {
                cart.remove(removedProduct);
                sum = 0;
                cart.forEach((item) {
                  sum = sum - item.price;
                });
              });
            }),
            CheckoutScreen(cart, sum),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            Future.delayed(Duration(seconds: 1), () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return FinalizarScreen();
              }));
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
