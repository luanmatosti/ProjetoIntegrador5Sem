import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final cart;
  final sum;

  CheckoutScreen(this.cart, this.sum);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(cart[index].name),
                    SizedBox(height: 8.0),
                    Text(
                      "\$${cart[index].price}",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: cart.length,
          shrinkWrap: true,
        ),
        Divider(),
        Text("Total : \$$sum"),
        Divider(),
        MaterialButton(
          onPressed: () {},
          color: Color.fromARGB(255, 255, 115, 34),
          height: 50.0,
          minWidth: double.minPositive,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Text(
            "Finalizar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
