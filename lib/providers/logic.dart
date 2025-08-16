import 'package:flutter/foundation.dart';
import 'dart:math';

class Game with ChangeNotifier {
  int flags = 3;
  int score = 0;
  int bombs = 0;
  bool flag = false;
  List<List<String>> board = [];
  List<List<String>> view = [];
  bool ready = false;

  void makeMap(int len) {
    score = 0;
    flags = 3;
    board = List.generate(
      len,
      (_) => List.generate(len, (_) {
        return (Random().nextInt(101) < 20) ? "b" : "s";
      }),
    );

    view = List.generate(
      len,
      (_) => List.generate(len, (_) {
        return "";
      }),
    );

    int holder = 0;
    for (var row in board) {
      for (var items in row) {
        if (items == "b") {
          holder += 1;
        }
      }
    }
    bombs = holder;

    ready = true;
  }

  void find(int col, int row) {
    if (view[col][row] == "") {
      if (flag) {
        if (board[col][row] == "b") {
          view[col][row] = "🚩";
          score += 1;
        } else if (board[col][row] == "s") {
          view[col][row] = "🚩";
          flags -= 1;
          score += 1;
        }
      } else if (!flag) {
        if (board[col][row] == "b") {
          view[col][row] = "💣";
        } else if (board[col][row] == "s") {
          view[col][row] = count(col, row).toString();
          score += 1;
        }
      }
    }

    notifyListeners();
  }

  bool checkLoss() {
    if (flags == 0) {
      return true;
    }
    for (var row in view) {
      for (var item in row) {
        if (item == "💣") {
          return true;
        }
      }
    }
    return false;
  }

  bool checkWin(int len) {
    if (checkFlags()) {
      if (score == len * len) {
        return true;
      }
    } else {
      if (score == ((len * len) - bombs)) {
        return true;
      }
    }
    return false;
  }

  bool checkFlags() {
    for (var row in view) {
      for (var item in row) {
        if (item == "🚩") {
          return true;
        }
      }
    }
    return false;
  }

  void unFlag() {
    flag = !flag;
    notifyListeners();
  }

  int count(int col, int row) {
    int a = 0;

    for (int c in [col - 1, col, col + 1]) {
      for (int r in [row - 1, row + 1]) {
        try {
          if (board[c][r] == "b") {
            a += 1;
          }
        } catch (e) {}
      }
    }

    for (int c in [col - 1, col + 1]) {
      try {
        if (board[c][row] == "b") {
          a += 1;
        }
      } catch (e) {}
    }

    return a;
  }
}

class Basic with ChangeNotifier {
  int pageindex = 0;
  int dif = 0;
  bool hint = false;
  double swidth = 0;
  double sheight = 0;

  void setDif(int ddd) {
    dif = ddd;
    pageindex = 1;
    notifyListeners();
  }
  void unHint(){
    hint = !hint;
    notifyListeners();
  }

  void lost() {
    pageindex = 2;
    notifyListeners();
  }

  void won() {
    pageindex = 3;
    notifyListeners();
  }

  void goBack(){
    pageindex = 0;
    notifyListeners();
  }
}
