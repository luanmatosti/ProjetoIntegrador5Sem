import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Carrinho",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
              ),
            ),
            SizedBox(height: 12.0),
            CartItem(),
            Divider(),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "\u0024 779,7",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Entrega",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "\u0024 40,00",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Subtotal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "\u0024 819,7",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            MaterialButton(
              onPressed: () {},
              color: Colors.cyan,
              height: 50.0,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                "Proceed to checkout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 18.0),
          ],
        ),
      ),
    );
  }
}

final MyController c = Get.put(MyController());

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(
                        "https://images.tcdn.com.br/img/img_prod/595531/tenis_ous_rafa_gomes_preto_cinza_essencial_9975_1_6b155168fc482662028d32808e8991bf.jpg"),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  child: Text(
                    "Nike Air Max",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 113, 245, 5),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add,color: Colors.white),
                        onPressed: ()=> c.increment(),
                      ),
                    ),
                    SizedBox(width: 20),
                    Obx(() => Text("${c.books.toString()}")),
                    SizedBox(width: 20),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 226, 7, 7),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove,color: Colors.white),
                        onPressed: ()=> c.decrement(),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\u0024 259,90",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
