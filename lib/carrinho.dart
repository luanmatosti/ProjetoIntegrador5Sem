import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();

}

class _CartViewState extends State<CartView>{
  @override

  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.black,),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Text(
              "Shopping cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              width: 80.0,
              height: 80.0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: NetworkImage("https://images.tcdn.com.br/img/img_prod/595531/tenis_ous_rafa_gomes_preto_cinza_essencial_9975_1_6b155168fc482662028d32808e8991bf.jpg"),
                ),
                borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              
              ),
            )
          ],
        ),
      ),
    );
  }
}