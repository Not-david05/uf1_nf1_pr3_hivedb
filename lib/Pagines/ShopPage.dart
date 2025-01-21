import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uf1_nf1_pr3_hivedb/Data/base_de_dades.dart';
class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final Box productsBox = Hive.box('box_tasques_app');
  final Box cartBox = Hive.box('cartBox');

  List products = [
    (titol: 'Producto 1', price: 10.0),
    (titol: 'Producto 2', price: 20.0),
    (titol: 'Producto 3', price: 30.0),
  ];

  void addToCart(product) {
    cartBox.add(product);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.titol),
          subtitle: Text('\$${product.price}'),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () => addToCart(product),
          ),
        );
      },
    );
  }
}
