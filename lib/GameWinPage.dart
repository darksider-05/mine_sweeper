import 'package:flutter/material.dart';

class Gamewin extends StatelessWidget {
  final VoidCallback wined;
  const Gamewin({super.key, required this.wined});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.cyanAccent,
      child: Column(
        spacing: 20,

        children: [
          SizedBox(height: 300),
          Text("🎉 you won! 🎉", style: TextStyle(fontSize: 25)),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: wined,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white38),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            child: Text(
              "start",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Container(width: MediaQuery.of(context).size.width),
        ],
      ),
    );
  }
}
