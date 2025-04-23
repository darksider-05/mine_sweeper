import 'package:flutter/material.dart';


class Gameover extends StatelessWidget {
  final VoidCallback change;
  const Gameover({super.key, required this.change});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,

      children: [
        Text("the game is over", style: TextStyle(fontSize: 25),),
        ElevatedButton(onPressed: change, child: Text("start")),
        Container(width: MediaQuery.of(context).size.width,)

      ],
    );
  }
}
