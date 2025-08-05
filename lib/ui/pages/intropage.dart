import "package:flutter/material.dart";
import "package:provider/provider.dart";
import '../../providers/logic.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = context.watch<Basic>();
    return Stack(
      children: [
        Center(
          child: Column(
            children: [
              Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.49,
                  ),
                  Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          basic.setDif(0);
                        },
                        child: Text("Easy"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          basic.setDif(1);
                        },
                        child: Text("Medium"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          basic.setDif(2);
                        },
                        child: Text("Hard"),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      basic.unHint();
                    },
                    child: Text("How To Play"),
                  ),
                ],
              ),
            ],
          ),
        ),
        basic.hint
            ? Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    basic.unHint();
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.4), // dim background
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("welcome to the game of minesweeper!"),
                          Text("the game is simple, so lets get started!"),
                          Text("1: tap on a block, if it is a bomb, you lose"),
                          Text("2: if not, it will tell the how many around"),
                          Text("3: flag a bomb if you find one"),
                          Text("4: flag wrong and you will lose a flag"),
                          Text("5: run out of flags and you lose"),
                          Text("""6: to win, clean every safe spot,\n      and flag all of the bombs"""),
                          Text("7: or play like a pro and don't use any flags,\n                only clear the safe spots"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
            : const SizedBox(),
      ],
    );
  }
}
