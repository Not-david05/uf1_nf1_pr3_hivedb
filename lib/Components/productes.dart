import 'package:flutter/material.dart';
import 'package:uf1_nf1_pr3_hivedb/Components/button.dart';

class Productes extends StatelessWidget {
  final TextEditingController tecText;
  final Function()?accioGuardar;
   final Function()?acciocancelar;
  const Productes ({super.key, required this.tecText, required this.accioGuardar, required this.acciocancelar});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: tecText,
              cursorColor: Colors.orange[300],
              decoration: InputDecoration(
              hintText: "Escriu el nombre del producte...",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.teal[100],
              ),),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Button(
                  TextBoto: "Guardar", 
                  accioBoto:accioGuardar
                  ),// Botó guardar.
                Button(
                  TextBoto: "Cancelar", 
                  accioBoto: acciocancelar
                   ),// Botó cancelar.
              ],
            ),
          ],
        ),
      ),
    );
  }
}