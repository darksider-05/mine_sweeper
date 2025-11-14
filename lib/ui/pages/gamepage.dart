import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/logic.dart';
import '../../providers/theme.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = context.watch<Basic>();
    final game = context.watch<Game>();
    final pallet = context.watch<Themes>();
    int len = switch (basic.dif) {
      0 => 6,
      1 => 9,
      2 => 12,
      _ => 0,
    };

    if (!game.ready) {
      game.makeMap(len);
    }

    var width = MediaQuery.of(context).size.shortestSide;
    var height = MediaQuery.of(context).size.longestSide;
    bool isver = MediaQuery.of(context).orientation == Orientation.portrait;
    var truewidth = isver ? width : height;
    var trueheight =
        isver
            ? height - kBottomNavigationBarHeight
            : width - kBottomNavigationBarHeight;

    return Stack(
      children: [
        Container(
          color: pallet.bg,
          child: Center(
            child: Column(
              spacing: min(trueheight, truewidth) * 0.02,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(len, (indc) {
                return Row(
                  spacing: min(trueheight, truewidth) * 0.02,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(len, (indr) {
                    return Material(
                      color: pallet.btn,
                      elevation: (game.view[indc][indr] == "0") ? 0 : 6,
                      child: SizedBox.square(
                        dimension: min(trueheight, truewidth) / (len + 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pallet.btn,
                            padding: EdgeInsets.all(0),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          onPressed:
                              (game.view[indc][indr] != "0")
                                  ? () {
                                    game.find(indc, indr);
                                    if (game.checkLoss()) {
                                      basic.lost();
                                      game.ready = false;
                                      game.flag = false;
                                    }
                                    if (game.checkWin(len)) {
                                      basic.won();
                                      game.ready = false;
                                      game.flag = false;
                                    }
                                  }
                                  : null,
                          child:
                              game.ready
                                  ? Text(
                                    game.view[indc][indr],
                                    style: TextStyle(color: pallet.txt),
                                  )
                                  : null,
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          child: Column(
            children: [
              Row(
                children: [SizedBox(width: MediaQuery.of(context).size.width)],
              ),
              Row(children: [Text("bombs: ${game.bombs}")]),
              Row(children: [Text("score: ${game.score}")]),
              Row(children: [Text("")]),
            ],
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).size.height * (8 / 100),
          left: MediaQuery.of(context).size.width * (6 / 100),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => game.unFlag(),
            icon:
                game.flag
                    ? Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: pallet.passout,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.flag, color: pallet.txt),
                          Text("${game.flags}x"),
                        ],
                      ),
                    )
                    : Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: pallet.passout,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Icon(Icons.flag, color: pallet.txt),
                              Positioned(
                                left: 2,
                                top: -1,
                                child: Text(
                                  "❌",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text("${game.flags}x"),
                        ],
                      ),
                    ),
          ),
        ),
      ],
    );
  }
}
