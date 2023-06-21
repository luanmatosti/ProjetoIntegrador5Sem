import 'package:echo_project/cart.dart';
import 'package:echo_project/finalizar.dart';
import 'package:echo_project/login_screen.dart';
import 'package:echo_project/products_detail.dart';
import 'package:echo_project/service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        leading: BackButton(
            onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }))),
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (
                  context,
                  index,
                ) {
                  return ListTile(
                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 30,
                    ),
                    subtitle: Text("Preço - \$" +
                        snapshot.data[index]['price'].toString()),
                    onTap: () {
                      Navigator.push(context,
                          // ignore: missing_return
                          MaterialPageRoute(builder: (context) {
                        return ProductDetails(snapshot.data[index]['id']);
                      }));
                    },
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return CartPage();
            }));
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
