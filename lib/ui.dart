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
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Game()),
      ChangeNotifierProvider(create: (_) => Basic()),
      ChangeNotifierProvider(create: (_) => Themes())
    ],
    child: Core(),);
  }
}



class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = context.watch<Basic>();
    final pallet = context.watch<Themes>();
    pallet.loadTheme();
    basic.sheight = MediaQuery.of(context).size.height;
    basic.swidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(textTheme: TextTheme(bodyMedium: TextStyle(color: pallet.txt))),
    home: Scaffold(
      drawer: Drwr(),
      body: switch(basic.pageindex){
        0 => IntroPage(),
        1 => GamePage(),
        2 => Losepage(),
        3 => WinPage(),
      _ => null
      },
    ),
    );
  }
}
