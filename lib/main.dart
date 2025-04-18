import 'package:flutter/material.dart';
import 'body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: 
          ElevatedButtonThemeData(
            style: ButtonStyle(
              shadowColor: WidgetStatePropertyAll(Colors.white),
              minimumSize: WidgetStatePropertyAll(Size(20, 50)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))
            )
          )
      ),
      home: Scaffold(
        body: bdy(),
      ),

    );
  }
}
