import 'dart:math';

class Matrixe {
  List matrice = [];
  List textholder = [];
  bool gameisover = false;
  int points = 0;

  Matrixe() { // constructor
    List row = [];
    for (int i = 1; i <= 6; i++) {
      for (int j = 1; j <= 6; j++) {
        int a = Random().nextInt(101);
        if (i < 3 && j < 3) {
        if(a < 40) { a=6;} else {a=5;}}
        else if (i < 3 && j > 4) {
        if(a < 40) { a=6;} else {a=5;}}
        else if (i > 4 && j < 3) {
        if(a < 40) { a=6;} else {a=5;}}
        else if (i > 4 && j > 4) {
        if(a < 40) { a=6;} else {a=5;}}
        else{ 
        if (a < 18) {a=6;} // 6 means bomb
         else {
          a = 5; // 5 means safe
        }
        row.add(a);
      }
      this.matrice.add(row);
      row = [];
    }

    for (int i = 0; i < 37;i++){
      textholder.add("  ");
    }

  }

  String tapped(String pos){ //checks for bombs and
    int row = int.parse(pos.split("")[0]);
    int col = int.parse(pos.split("")[1]);
    int found = 0;
    int found_set = 0;

    if(matrice[row][col] != 6){
      for (int i in [row-1, row+1, row]){

        for (int j in [col-1, col+1]){ //checks the right and left sides of the tapped
          if (i >= 0 && i <= 5){
            if (j >= 0 && j <= 5){
              if (matrice[i][j] == 6){
                found++;
              }
            }
          }

        }

        found_set += found;
        found = 0;

      }

      for (int i in [row-1, row+1]){

        for (int j in [col]){
          if (i >= 0 && i <= 5){
            if(j >= 0 && j <= 5){
              if (matrice[i][j] == 6){
                found++;
              }
            }
          }

        }

        found_set += found;
        found = 0;

      }
      return "$found_set";
    } else{
      gameisover = true;
      return "💣";
    }
  }

  String bomb_counter(){
    int counter = 0;
    for (List i in matrice){
      for (int j in i){
        if (j == 6){
          counter++;
        }
      }
    }
    return counter.toString();
  }

  bool haswon(){
    if (points == (36-(int.parse(bomb_counter())))){
      return true;
    } else{
      return false;
    }
  }


}}