import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uf1_nf1_pr3_hivedb/Data/base_de_dades.dart';
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Box cartBox = Hive.box('cartBox');

  void removeFromCart(int index) {
    cartBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartBox.length,
      itemBuilder: (context, index) {
        final product = cartBox.getAt(index);
        return ListTile(
          title: Text(product!.titol),
          subtitle: Text('\$${product.price}'),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () => removeFromCart(index),
          ),
        );
      },
    );
  }
}
