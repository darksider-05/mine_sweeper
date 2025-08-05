import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/logic.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = context.watch<Basic>();
    final game = context.watch<Game>();
    int len = switch (basic.dif) {
      0 => 6,
      1 => 9,
      2 => 12,
      _ => 0,
    };

    if (!game.ready) {
      game.makeMap(len);
    }

    return Stack(
      children: [
        Center(
          child: Column(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(len, (indc) {
              return Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(len, (indr) {
                  return Material(
                    elevation: (game.view[indc][indr] == "0") ? 0 : 6,
                    child: SizedBox.square(
                      dimension: MediaQuery.of(context).size.width / (len + 4),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
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
                                  }
                                  if (game.checkWin(len)) {
                                    basic.won();
                                    game.ready = false;
                                  }
                                }
                                : null,
                        child: game.ready ? Text(game.view[indc][indr]) : null,
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
        ),
        Positioned(top:10, child: Text("bombs: ${game.bombs}")),
        Positioned(top:25,child: Text("score: ${game.score}")),
        Positioned(
          top: MediaQuery.of(context).size.height * (8 / 100),
          left: MediaQuery.of(context).size.width * (6 / 100),
          child: IconButton(
            onPressed: () => game.unflag(),
            icon:
                game.flag
                    ? Column(
                      children: [
                        Icon(Icons.flag),
                        Text("${game.flags}x")
                      ],
                    )
                    : Column(
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              left: 3,
                              top: 4,
                              child: Icon(Icons.flag, size: 25),
                            ),
                            Text("❌", style: TextStyle(fontSize: 25)),
                          ],
                        ),
                        Text("${game.flags}x")
                      ],
                    ),
          ),
        ),
      ],
    );
  }
}
