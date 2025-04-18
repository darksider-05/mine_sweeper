import 'package:flutter/material.dart';
import 'matrixx.dart';

class coloum extends StatefulWidget {
  final VoidCallback change;
  final VoidCallback win;
  coloum({super.key, required this.change, required this.win});

  @override
  State<coloum> createState() => _coloumState();
}

class _coloumState extends State<coloum> {
  bool hasrun = false;
  var matrice_object;

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
                  if (matrice_object.textholder[0] == "  ") {
                    matrice_object.textholder[0] = matrice_object.tapped("00");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[0]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[1] == "  ") {
                    matrice_object.textholder[1] = matrice_object.tapped("01");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[1]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[2] == "  ") {
                    matrice_object.textholder[2] = matrice_object.tapped("02");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[2]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[3] == "  ") {
                    matrice_object.textholder[3] = matrice_object.tapped("03");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[3]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[4] == "  ") {
                    matrice_object.textholder[4] = matrice_object.tapped("04");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[4]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[5] == "  ") {
                    matrice_object.textholder[5] = matrice_object.tapped("05");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
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
                  if (matrice_object.textholder[6] == "  ") {
                    matrice_object.textholder[6] = matrice_object.tapped("10");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[6]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[7] == "  ") {
                    matrice_object.textholder[7] = matrice_object.tapped("11");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[7]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[8] == "  ") {
                    matrice_object.textholder[8] = matrice_object.tapped("12");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[8]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[9] == "  ") {
                    matrice_object.textholder[9] = matrice_object.tapped("13");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[9]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[10] == "  ") {
                    matrice_object.textholder[10] = matrice_object.tapped("14");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[10]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[11] == "  ") {
                    matrice_object.textholder[11] = matrice_object.tapped("15");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
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
                  if (matrice_object.textholder[12] == "  ") {
                    matrice_object.textholder[12] = matrice_object.tapped("20");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[12]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[13] == "  ") {
                    matrice_object.textholder[13] = matrice_object.tapped("21");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[13]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[14] == "  ") {
                    matrice_object.textholder[14] = matrice_object.tapped("22");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[14]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[15] == "  ") {
                    matrice_object.textholder[15] = matrice_object.tapped("23");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[15]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[16] == "  ") {
                    matrice_object.textholder[16] = matrice_object.tapped("24");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[16]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[17] == "  ") {
                    matrice_object.textholder[17] = matrice_object.tapped("25");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
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
                  if (matrice_object.textholder[18] == "  ") {
                    matrice_object.textholder[18] = matrice_object.tapped("30");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[18]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[19] == "  ") {
                    matrice_object.textholder[19] = matrice_object.tapped("31");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[19]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[20] == "  ") {
                    matrice_object.textholder[20] = matrice_object.tapped("32");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[20]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[21] == "  ") {
                    matrice_object.textholder[21] = matrice_object.tapped("33");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[21]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[22] == "  ") {
                    matrice_object.textholder[22] = matrice_object.tapped("34");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[22]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[23] == "  ") {
                    matrice_object.textholder[23] = matrice_object.tapped("35");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
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
                  if (matrice_object.textholder[24] == "  ") {
                    matrice_object.textholder[24] = matrice_object.tapped("40");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[24]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[25] == "  ") {
                    matrice_object.textholder[25] = matrice_object.tapped("41");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[25]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[26] == "  ") {
                    matrice_object.textholder[26] = matrice_object.tapped("42");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[26]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[27] == "  ") {
                    matrice_object.textholder[27] = matrice_object.tapped("43");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[27]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[28] == "  ") {
                    matrice_object.textholder[28] = matrice_object.tapped("44");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[28]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[29] == "  ") {
                    matrice_object.textholder[29] = matrice_object.tapped("45");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
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
                  if (matrice_object.textholder[30] == "  ") {
                    matrice_object.textholder[30] = matrice_object.tapped("50");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[30]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[31] == "  ") {
                    matrice_object.textholder[31] = matrice_object.tapped("51");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[31]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[32] == "  ") {
                    matrice_object.textholder[32] = matrice_object.tapped("52");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[32]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[33] == "  ") {
                    matrice_object.textholder[33] = matrice_object.tapped("53");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[33]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[34] == "  ") {
                    matrice_object.textholder[34] = matrice_object.tapped("54");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
                });
              },
              child: Text(matrice_object.textholder[34]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (matrice_object.textholder[35] == "  ") {
                    matrice_object.textholder[35] = matrice_object.tapped("55");
                    matrice_object.points++;
                  }
                  if (matrice_object.gameisover == true) {
                    widget.change();
                    matrice_object.gameisover = false;
                    hasrun = false;
                  }
                  if (matrice_object.haswon()){
                    widget.win();
                    hasrun = false;
                  }
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
