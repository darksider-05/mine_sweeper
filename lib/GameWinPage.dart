import 'package:flutter/material.dart';


class Gamewin extends StatelessWidget {
  final VoidCallback wined;
  const Gamewin({super.key, required this.wined});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,

      children: [
        Text("you won!", style: TextStyle(fontSize: 25),),
        ElevatedButton(onPressed: wined, child: Text("start")),
        Container(width: MediaQuery.of(context).size.width,)

      ],
    );
  }
}
