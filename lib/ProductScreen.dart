import 'package:flutter/material.dart';

import 'ProductModel.dart';

class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter;
  final ValueSetter<ProductModel> removerSetter;

  ProductScreen(this._valueSetter, this.removerSetter);

  List<ProductModel> products = [
    ProductModel("Mic", 50),
    ProductModel("LED Monitor", 100),
    ProductModel("Mouse", 5),
    ProductModel("Keyboard", 10),
    ProductModel("Speaker", 50),
    ProductModel("CD", 3),
    ProductModel("Violao", 100),
    ProductModel("PS5", 5000),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      _valueSetter(products[index]);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      removerSetter(products[index]);
                    },
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index].name,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${products[index].price}",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: products.length);
  }
}
