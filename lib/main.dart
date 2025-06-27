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

  Future<bool> isSetupDone() async {
    return await storageService.getSetupDone() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: FutureBuilder(
        future: isSetupDone(), 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Color(0xff9D71E8),
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          }
          else if(!snapshot.hasData) {
            return SetupPage();
          } else {
            return HomePage();
          }
        } 
      ),
    );
  }
}