import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:uf1_nf1_pr3_hivedb/Data/base_de_dades.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  BaseDeDades db = BaseDeDades();
  final Box cartBox = Hive.box("cartBox");

  void removeFromCart(int index) {
    setState(() {
      cartBox.deleteAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Producto eliminado del carrito")),
    );
  }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Carrito de Compras", style: TextStyle(color: Colors.grey),),
      ),
      body: cartBox.isEmpty
          ? Center(child: Text("No hay productos en el carrito"))
          : ListView.builder(
              itemCount: cartBox.length,
              itemBuilder: (context, index) {
                Map product = cartBox.get(index); // Obtener el producto del carrito

                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          onPressed: (context) => removeFromCart(index),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 242, 247, 246),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(product["titol"]), // Mostrar el título del producto
                        trailing: Icon(Icons.shopping_cart, color: const Color.fromARGB(255, 2, 250, 56)),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
