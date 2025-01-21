
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uf1_nf1_pr3_hivedb/Pagines/PaginaPrincipal.dart';

void main() async {
 await Hive.initFlutter();
  await Hive.openBox("Products");
  await Hive.openBox("cartBox");
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaPrincipal(),
    );
  }
}