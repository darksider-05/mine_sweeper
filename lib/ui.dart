import 'package:flutter/material.dart';
import 'ui/pages/losepage.dart';
import 'ui/pages/winpage.dart';
import 'package:provider/provider.dart';
import 'providers/logic.dart';
import 'ui/pages/intropage.dart';
import 'ui/pages/gamepage.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Game()),
      ChangeNotifierProvider(create: (_) => Basic())
    ],
    child: Core(),);
  }
}



class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = context.watch<Basic>();
    basic.Sheight = MediaQuery.of(context).size.height;
    basic.Swidth = MediaQuery.of(context).size.width;
    return MaterialApp(
    home: Scaffold(
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
