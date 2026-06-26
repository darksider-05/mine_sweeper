import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/logic.dart';
import '../../providers/theme.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool flagMode = false;

  @override
  Widget build(BuildContext context) {
    final basic = context.watch<Navigation>();
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
                      elevation:
                          (game.grid[indc][indr].visibility ==
                                  CellVisibility.revealed)
                              ? 0
                              : 6,
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
                              (game.grid[indc][indr].visibility ==
                                      CellVisibility.hidden)
                                  ? () => game.cellInteract(
                                    x: indc,
                                    y: indr,
                                    isFlagMode: flagMode,
                                  )
                                  : null,
                          child:
                              game.ready
                                  ? Text(
                                    game.grid[indc][indr].toString(),
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

              Row(children: [Text("")]),
            ],
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).size.height * (8 / 100),
          left: MediaQuery.of(context).size.width * (6 / 100),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed:
                () => setState(() {
                  flagMode = !flagMode;
                }),
            icon:
                flagMode
                    ? Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: pallet.passout,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.flag, color: pallet.txt),
                          Text("${game.forgiveness}x"),
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
                          Text("${game.forgiveness}x"),
                        ],
                      ),
                    ),
          ),
        ),
      ],
    );
  }
}
