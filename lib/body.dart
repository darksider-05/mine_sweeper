import 'package:flutter/material.dart';
import 'ui.dart';
import 'GameOverPage.dart';
import 'GameWinPage.dart';

class bdy extends StatefulWidget {
  const bdy({super.key});

  @override
  State<bdy> createState() => _bdyState();
}

class _bdyState extends State<bdy> {
  int index = 1;
  // 1 is game, 2 is gameover, 3 is win
  void indexshift() {
    if (index == 1) {
      index = 0;
    } else {
      index = 1;
    }
  }

  void indexshift2() {
    if (index == 1){
      index = 2;
    } else {
      index = 1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      alignment: Alignment.center,
      children: [
        Stack(
          children: [
            Positioned(
              child: Gameover(
                change: () {
                  setState(() {
                    indexshift();
                  });
                },
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Positioned(
              top: 240,
              child: Game_body(
                change: () {
                  setState(() {
                    indexshift();
                  });
                },
                win: (){
                  setState(() {
                    indexshift2();
                  });
                },
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Positioned(
              child: Gamewin(
                wined: (){
                  setState(() {
                    indexshift2();
                  });
                }
              ))
          ],
        )
      ],
    );
  }
}
