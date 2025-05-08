import 'package:flutter/material.dart';

class Gameover extends StatelessWidget {
  final VoidCallback change;
  const Gameover({super.key, required this.change});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.greenAccent[400],
      child: Column(
        spacing: 20,

        children: [
          SizedBox(height: 300),
          Text("the game is over", style: TextStyle(fontSize: 25)),
          ElevatedButton(
            onPressed: change,
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
          Text(
            """
tip:
1. you will lose if the block that you tapped on was a mine

2. when you tap on a block, it will show the number of mines
 that are around it horizonally, vertically, and diagonally

3.i havn't added the flag mechanics, so for now you have to 
clear all of the blocks that are not mines 
"""
            ),
          Container(width: MediaQuery.of(context).size.width),
        ],
      ),
    );
  }
}
