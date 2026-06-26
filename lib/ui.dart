import 'package:flutter/material.dart';
import 'ui/drawer.dart';
import 'ui/pages/losepage.dart';
import 'ui/pages/winpage.dart';
import 'package:provider/provider.dart';
import 'providers/logic.dart';
import 'providers/theme.dart';
import 'ui/pages/intropage.dart';
import 'ui/pages/gamepage.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Game()),
        ChangeNotifierProvider(create: (_) => Navigation()),
        ChangeNotifierProvider(create: (_) => Themes()),
      ],
      child: Core(),
    );
  }
}

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = context.watch<Navigation>();
    final game = context.watch<Game>();
    final pallet = context.watch<Themes>();
    pallet.loadTheme();
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(bodyMedium: TextStyle(color: pallet.txt)),
      ),
      home: Scaffold(
        drawer: Drwr(),
        body:
            (basic.isIntro)
                ? IntroPage()
                : (!game.lost && !game.won)
                ? GamePage()
                : game.lost & !game.won
                ? Losepage()
                : game.won & !game.lost
                ? WinPage()
                : null,

        // {
        //   0 => IntroPage(),
        //   1 => GamePage(),
        //   2 => Losepage(),
        //   3 => WinPage(),
        //   _ => null,
        // },
      ),
    );
  }
}
