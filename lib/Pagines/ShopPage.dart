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
      db.Products.add({
        "titol": tecText.text,
        "valor": false,
      });
      db.actualizarDades();
    });
    acciocancelar();
  }

  void acciocancelar() {
    Navigator.of(context).pop();
    tecText.clear();
  }

  void accioEsborrarTasca(int posLlista) {
    setState(() {
      db.Products.removeAt(posLlista);
      db.actualizarDades();
    });
    Navigator.of(context).pop(); // Cierra el diálogo después de borrar
  }

  void crearNovaTasca() {
    showDialog(
      context: context,
      builder: (context) {
        return Productes(
          tecText: tecText,
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


  void addToCart(Map product) {
  String productTitle = product["titol"]; // Extrae solo el título
  db.addToCart(product);  // Pasamos solo el título del producto
  setState(() {});  // Forzamos la actualización de la UI

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("$productTitle añadido al carrito")),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Shop",style: TextStyle(color: Colors.grey),),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: crearNovaTasca,
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
          final products = db.Products[index];

          return ListTile(
            title: Text(products["titol"]),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart, color: Colors.green),
              onPressed: () => addToCart(products),
            ),
          );
        },
      ),
    );
  }
}
