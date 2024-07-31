import 'package:flutter/material.dart';
import 'package:rest_app/main_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Product Store',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
      useMaterial3: false,
    ),
    home: const MainPage(),
  ));
}
