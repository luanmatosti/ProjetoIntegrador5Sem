import 'package:echo_project/finalizar.dart';
import 'package:echo_project/login_screen.dart';
import 'package:echo_project/service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final double price;
  int quantity;

  Product({this.name, this.price, this.quantity = 0});
}

final allIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho de Compras',
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  CartPage({key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double calculateTotal(List<dynamic> data) {
    double total = 0.0;
    for (var item in data) {
      double price = item['price'];
      int quantity = item['quantity'];
      total += price * quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiService().getCart(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['title']),
                    subtitle: Text(
                      (snapshot.data[index]['price'] *
                              snapshot.data[index]['quantity'])
                          .toString(),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (snapshot.data[index]['quantity'] > 0) {
                              ApiService()
                                  .modifyQuantity(
                                snapshot.data[index]['id'],
                                snapshot.data[index]['quantity'] - 1,
                              )
                                  .then((_) {
                                setState(() {});
                              });
                            }
                          },
                        ),
                        Text(
                          snapshot.data[index]['quantity'].toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            if (snapshot.data[index]['quantity'] > 0) {
                              ApiService()
                                  .modifyQuantity(
                                snapshot.data[index]['id'],
                                snapshot.data[index]['quantity'] + 1,
                              )
                                  .then((_) {
                                setState(() {});
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FutureBuilder(
        future: ApiService().getCart(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            double total = calculateTotal(snapshot.data);
            return FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Compra Finalizada'),
                      content: Text('Total: $total'),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            for (int id in allIds) {
                              await ApiService().cleanCart(id);
                            }

                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            });
                          },
                          child: Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
              label: Text('Finalizar Compra'),
              icon: Icon(Icons.shopping_cart),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
