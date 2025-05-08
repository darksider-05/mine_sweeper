import 'package:flutter/material.dart';
import 'body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.orange[400],
        elevatedButtonTheme: 
          ElevatedButtonThemeData(
            style: ButtonStyle(
              shadowColor: WidgetStatePropertyAll(null),
              minimumSize: WidgetStatePropertyAll(Size(20, 50)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
              backgroundColor: WidgetStateProperty.all(Colors.amber[300])
            )
          )
      ),
      home: Scaffold(
        body: bdy(),
      ),

    );
  }
}
