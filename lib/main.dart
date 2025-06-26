import 'package:falty/pages/home_page.dart';
import 'package:falty/pages/setup_page.dart';
import 'package:falty/services/storage_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final StorageService storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: SetupPage(),
    );
  }
}