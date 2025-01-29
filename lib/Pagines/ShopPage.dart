import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uf1_nf1_pr3_hivedb/Components/productes.dart';
import 'package:uf1_nf1_pr3_hivedb/Data/base_de_dades.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final Box _boxHive = Hive.box("Products");
  BaseDeDades db = BaseDeDades();
  TextEditingController tecText = TextEditingController();
  TextEditingController tecPrecio = TextEditingController(); // Para el precio

  @override
  void initState() {
    super.initState();
    
    if (_boxHive.get("Products") == null) {
      db.crProducts();
      db.actualizarDades();
    } else {
      db.carregarDades();
    }
  }

  void accioGuardar() {
    setState(() {
      double precio = double.tryParse(tecPrecio.text) ?? 0.0;
      db.Products.add({
        "titol": tecText.text,
        "precio": precio, 
        "valor": false,
      });
      db.actualizarDades();
    });
    acciocancelar();
  }

  void acciocancelar() {
    Navigator.of(context).pop();
    tecText.clear();
    tecPrecio.clear();
  }

  void accioEsborrarTasca(int posLlista) {
    setState(() {
      db.Products.removeAt(posLlista);
      db.actualizarDades();
    });
    Navigator.of(context).pop(); // Cierra el diálogo después de borrar
  }

  void crearNuevaTarea() {
    showDialog(
      context: context,
      builder: (context) {
        return Productes(
          tecText: tecText,
          tecPrecio: tecPrecio, // Pasamos el controlador del precio
          accioGuardar: accioGuardar,
          acciocancelar: acciocancelar,
        );
      },
    );
  }

  void eliminarProductoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Selecciona producto a eliminar"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: db.Products.length,
              itemBuilder: (context, index) {
                final product = db.Products[index];
                return ListTile(
                  title: Text(product["titol"]),
                  subtitle: Text("Precio: \$${_formatPrecio(product["precio"])}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => accioEsborrarTasca(index),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  String _formatPrecio(dynamic precio) {
    if (precio is num) {
      return precio.toStringAsFixed(2);
    }
    return "0.00"; // Valor por defecto si no es válido
  }

  void addToCart(Map product) {
    db.addToCart(product);
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${product["titol"]} añadido al carrito")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Shop", style: TextStyle(color: Colors.grey)),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: crearNuevaTarea,
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: eliminarProductoDialog,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: db.Products.length,
        itemBuilder: (context, index) {
          final product = db.Products[index];

          return ListTile(
            title: Text(product["titol"]),
            subtitle: Text("Precio: \$${_formatPrecio(product["precio"])}"),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart, color: Colors.green),
              onPressed: () => addToCart(product),
            ),
          );
        },
      ),
    );
  }
}
