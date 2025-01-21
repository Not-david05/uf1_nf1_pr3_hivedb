import 'package:hive/hive.dart';


class BaseDeDades {
  final Box _boxDeLaHive = Hive.box("Products");
  final Box _cartBox = Hive.box("cartBox");

  List get Products => _boxDeLaHive.values.toList();
  List get cartList => _cartBox.values.toList();

  void crDadesNull() {
    if (_boxDeLaHive.isEmpty) {
      _boxDeLaHive.addAll([
      (titol: "Producto 1", price: 10.0),
      (titol: "Producto 2", price: 20.0),
      (titol: "Producto 3", price: 30.0),
      ]);
    }
  }

  void actDades() {
    _boxDeLaHive.clear();
    _boxDeLaHive.addAll(Products);
  }

  void addToCart(product) {
    _cartBox.add(product);
  }

  void removeFromCart(int index) {
    _cartBox.deleteAt(index);
  }
}