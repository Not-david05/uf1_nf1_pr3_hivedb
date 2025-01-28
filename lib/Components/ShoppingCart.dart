import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class Shoppingcart extends StatelessWidget {
  final String textTasca;
  
  final Function(BuildContext)? esborrarTasca;
  const Shoppingcart(
    {super.key, 
    required this.textTasca,
    
    required this.esborrarTasca});
  void funcioPelCheckbox(bool valor){

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10,right:10,top:10),
      child: Slidable(
        endActionPane:ActionPane(
          motion: const StretchMotion(), 
          children:[
            SlidableAction(
            icon:Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
            onPressed: esborrarTasca,
            ),
          ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.teal[300], borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
