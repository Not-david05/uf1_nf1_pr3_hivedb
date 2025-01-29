import 'package:flutter/material.dart';
import 'package:uf1_nf1_pr3_hivedb/Components/button.dart';

class Productes extends StatelessWidget {
  final TextEditingController tecText;
  final TextEditingController tecPrecio; // Controlador para el precio
  final Function()? accioGuardar;
  final Function()? acciocancelar;

  const Productes({
    super.key,
    required this.tecText,
    required this.tecPrecio, // Añadido controlador del precio
    required this.accioGuardar,
    required this.acciocancelar,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        height: 200, // Ajustado para incluir el campo de precio
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Campo para el nombre del producto
            TextField(
              controller: tecText,
              cursorColor: Colors.orange[300],
              decoration: InputDecoration(
                hintText: "Escribe el nombre del producto...",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal[100],
              ),
            ),
            SizedBox(height: 10),
            // Campo para el precio del producto
            TextField(
              controller: tecPrecio,
              cursorColor: Colors.orange[300],
              keyboardType: TextInputType.number, // Solo números
              decoration: InputDecoration(
                hintText: "Escribe el precio...",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal[100],
              ),
            ),
            SizedBox(height: 10),
            // Botones de Guardar y Cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(TextBoto: "Guardar", accioBoto: accioGuardar),
                Button(TextBoto: "Cancelar", accioBoto: acciocancelar),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
