import 'package:hive/hive.dart';

class BaseDeDades {
  final Box _Products = Hive.box("Products");
  final Box _cartBox = Hive.box("cartBox");

  List Products = [];
  List cartBox = [];

  void crProducts() {
    Products = [
      {"titol": "Tasca 1", "valor": false, "precio": 10.99},
      {"titol": "Tasca 2", "valor": false, "precio": 15.49},
      {"titol": "Tasca 3", "valor": false, "precio": 7.99},
    ];
  }

  void addToCart(Map product) {
    int index = _cartBox.length;
    _cartBox.put(index, product);
    print("Producto añadido al carrito: ${product['titol']}, Precio: ${product['precio']}");
  }

  void removeFromCart(int index) {
    cartBox.removeAt(index);
    _cartBox.put("cartBox", cartBox);
  }

  void carregarDades() {
    Products = _Products.get("Products") ?? [];
  }

  void carregarCarrito() {
    var datos = _cartBox.get("cartBox");
    cartBox = datos != null ? List.from(datos) : [];
  }

  void actualizarDades() {
    _Products.put("Products", List.from(Products));
  }

  void actualizarCarrito() {
    _cartBox.put("cartBox", List.from(cartBox));
  }
}
