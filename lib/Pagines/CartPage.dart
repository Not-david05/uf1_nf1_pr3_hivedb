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
 
  TextEditingController tecText = TextEditingController();
  void removeFromCart(int index) {
    setState(() {
      cartBox.deleteAt(index);
       db.actualizarDades();});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Producto eliminado del carrito"))
    );
  }
@override
Widget build(BuildContext context) {
  print("Contenido del carrito: ${cartBox.toMap()}");  // Verifica el contenido completo del carrito

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text("Carrito de Compras"),
    ),
    body: cartBox.isEmpty
        ? Center(child: Text("No hay productos en el carrito"))
        : ListView.builder(
            itemCount: cartBox.length,
            itemBuilder: (context, index) {
              Map product = cartBox.get(index);  // Usamos el índice para obtener el producto

              return ListTile(
                title: Text(product["titol"]),  // Mostrar el título del producto
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => removeFromCart(index),  // Usamos el índice para eliminar
                ),
              );
            },
          ),
  );
}

}
