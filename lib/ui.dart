import 'package:flutter/material.dart';
import 'GameBoard.dart';

class Game_body extends StatefulWidget {
  final VoidCallback change;
  final VoidCallback win;
  const Game_body({super.key, required this.change, required this.win});

  @override
  State<Game_body> createState() => _Game_bodyState();
}

class _Game_bodyState extends State<Game_body> {
  bool hasrun = false;
  var matrice_object;

  void buttons_func(int a, String b) {
    
    if (matrice_object.textholder[a] == "  ") {
      matrice_object.textholder[a] = matrice_object.tapped(b);
      if (matrice_object.textholder[a] != "💣"){
        matrice_object.points ++;
      }
    }
    
    if (matrice_object.points == 0 && matrice_object.gameisover == true){
      matrice_object.gameisover = false;
      hasrun = false;
      
      
    }
    
    

    if (matrice_object.points != 0 && matrice_object.gameisover == true) {
      widget.change();
      matrice_object.gameisover = false;
      hasrun = false;
    }
    if (matrice_object.haswon()) {
      widget.win();
      hasrun = false;
    }
    

  }

  @override
  Widget build(BuildContext context) {
    if (hasrun == false) {
      var a = Matrixe();
      matrice_object = a;
      hasrun = true;
    }

    return Column(
      spacing: 15,
      children: [
        Text("bombs: ${matrice_object.bomb_counter()}"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(0, "00");
                });
              },
              child: Text(matrice_object.textholder[0]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(1, "01");
                });
              },
              child: Text(matrice_object.textholder[1]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(2, "02");
                });
              },
              child: Text(matrice_object.textholder[2]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(3, "03");
                });
              },
              child: Text(matrice_object.textholder[3]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(4, "04");
                });
              },
              child: Text(matrice_object.textholder[4]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(5, "05");
                });
              },
              child: Text(matrice_object.textholder[5]),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(6, "10");
                });
              },
              child: Text(matrice_object.textholder[6]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(7, "11");
                });
              },
              child: Text(matrice_object.textholder[7]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(8, "12");
                });
              },
              child: Text(matrice_object.textholder[8]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(9, "13");
                });
              },
              child: Text(matrice_object.textholder[9]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(10, "14");
                });
              },
              child: Text(matrice_object.textholder[10]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(11, "15");
                });
              },
              child: Text(matrice_object.textholder[11]),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(12, "20");
                });
              },
              child: Text(matrice_object.textholder[12]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(13, "21");
                });
              },
              child: Text(matrice_object.textholder[13]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(14, "22");
                });
              },
              child: Text(matrice_object.textholder[14]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(15, "23");
                });
              },
              child: Text(matrice_object.textholder[15]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(16, "24");
                });
              },
              child: Text(matrice_object.textholder[16]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(17, "25");
                });
              },
              child: Text(matrice_object.textholder[17]),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(18, "30");
                });
              },
              child: Text(matrice_object.textholder[18]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(19, "31");
                });
              },
              child: Text(matrice_object.textholder[19]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(20, "32");
                });
              },
              child: Text(matrice_object.textholder[20]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(21, "33");
                });
              },
              child: Text(matrice_object.textholder[21]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(22, "34");
                });
              },
              child: Text(matrice_object.textholder[22]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(23, "35");
                });
              },
              child: Text(matrice_object.textholder[23]),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(24, "40");
                });
              },
              child: Text(matrice_object.textholder[24]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(25, "41");
                });
              },
              child: Text(matrice_object.textholder[25]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(26, "42");
                });
              },
              child: Text(matrice_object.textholder[26]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(27, "43");
                });
              },
              child: Text(matrice_object.textholder[27]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(28, "44");
                });
              },
              child: Text(matrice_object.textholder[28]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(29, "45");
                });
              },
              child: Text(matrice_object.textholder[29]),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(30, "50");
                });
              },
              child: Text(matrice_object.textholder[30]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(31, "51");
                });
              },
              child: Text(matrice_object.textholder[31]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(32, "52");
                });
              },
              child: Text(matrice_object.textholder[32]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(33, "53");
                });
              },
              child: Text(matrice_object.textholder[33]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(34, "54");
                });
              },
              child: Text(matrice_object.textholder[34]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttons_func(35, "55");
                });
              },
              child: Text(matrice_object.textholder[35]),
            ),
          ],
        ),
        Container(width: MediaQuery.of(context).size.width),
        Text("score: ${matrice_object.points}"),
      ],
    );
  }
}
