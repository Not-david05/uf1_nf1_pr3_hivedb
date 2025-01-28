import 'package:hive/hive.dart';


class BaseDeDades {
  final Box _Products = Hive.box("Products");
  final Box _cartBox = Hive.box("cartBox");

  List Products =[];
  List cartBox =[];


  void crProducts() {
    
      Products=[
    {"titol":"Tasca 1","valor":false},
    {"titol":"Tasca 2","valor":false},
    {"titol":"Tasca 3","valor":false},
      ];
  }
 void addToCart(Map product) {
  int index = _cartBox.length;  // Usamos el índice basado en la longitud de cartBox
  _cartBox.put(index, product);  // Usamos el índice como clave
  print("Producto añadido al carrito: ${product['titol']}");
}
  void removeFromCart(int index) {
    _cartBox.deleteAt(index);
  }
  void carregarDades(){
   Products= _Products.get("Products");
  
  }
  void carregarCarrito() {
    cartBox = _cartBox.get("cartBox");
  }
  void actualizarDades(){
    _Products.put("Products",  Products );
  }
  void actualizarCarrito() {
    _cartBox.put("cartBox", cartBox);
  }
}
