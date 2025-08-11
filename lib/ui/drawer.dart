import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme.dart';


class Drwr extends StatelessWidget {
  const Drwr({super.key});

  @override
  Widget build(BuildContext context) {
    final pallet = context.watch<Themes>();

    return Drawer(
      child: Container(
        color: pallet.bg,
        child: Container(
          color: pallet.bgi,
          child: Column(
            spacing: 5,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                color: pallet.btn,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(padding: EdgeInsets.all(10),child: Text("Themes", style: TextStyle(fontSize: 25),)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  spacing: 10,
                  children: lst(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> lst(BuildContext con){

List<List<dynamic>> options = [
  [Color(0xFFFF5722), Color(0xFFFFB300), "Yellow"],
  [Color(0xFF512DA8), Color(0xFF009688), "Purple"],
  [Color(0xDD000000), Color(0x62FFFFFF), "Black"],
  [Color(0xFFFFFFFF), Color(0x1F000000), "White"],
  [Color(0xFF388E3C), Color(0xFFFFEB3B), "Green"],
  [Color(0xFF00023D), Color(0xFFFFEB3B), "Python"],
  [Color(0xFFBD2789), Color(0xFF7D0EC3), "Pink"]
];
List<Widget> thimes = List.generate(options.length, (index) {
  var current = options[index];
  return GestureDetector(
    onTap: () {
      switch (current[2]) {
        case 'Yellow':
          Provider.of<Themes>(con, listen: false).setYellow();
          break;
        case 'Purple':
          Provider.of<Themes>(con, listen: false).setPurple();
          break;
        case 'Black':
          Provider.of<Themes>(con, listen: false).setBlack();
          break;
        case 'White':
          Provider.of<Themes>(con, listen: false).setWhite();
          break;
        case 'Green':
          Provider.of<Themes>(con, listen: false).setGreen();
          break;
        case 'Python':
          Provider.of<Themes>(con, listen: false).setPython();
          break;
        case 'Pink':
          Provider.of<Themes>(con, listen: false).setPink();
          break;
        default:
          null;
      }
      Scaffold.of(con).closeDrawer();
    },
    child: Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 5),
          child: SizedBox.square(
            dimension: 25,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 20,
                  height: 20,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: current[0])),
                Container(width: 10,
                  height: 10,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: current[1]))
              ],
            ),
          ),
        ),
        Text(current[2])
      ],
    ),
  );
});
return thimes;}