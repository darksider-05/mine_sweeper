import 'package:flutter/foundation.dart';
import 'dart:math';

enum CellVisibility { revealed, hidden }

enum CellFlag { flagged, unflagged }

enum CellContent { bomb, safe }

enum InteractResult { nothing, flagMistake, death }

class Cell {
  final int x;
  final int y;
  final CellContent content;

  late final int bombCount;

  List<Cell> neighbors = [];
  CellVisibility visibility = CellVisibility.hidden;
  CellFlag flagged = CellFlag.unflagged;
  Cell({required this.x, required this.y, required this.content});

  InteractResult interact({required bool isFlagMode, int depth = 0}) {
    if (visibility == CellVisibility.revealed) return InteractResult.nothing;

    visibility = CellVisibility.revealed;

    if (bombCount == 0) {
      for (final neighbor in neighbors) {
        neighbor.interact(isFlagMode: false, depth: depth + 1);
      }
    }

    if (isFlagMode) flagged = CellFlag.flagged;
    if (isFlagMode) {
      if (content == CellContent.bomb) {
        return InteractResult.nothing;
      } else {
        return InteractResult.flagMistake;
      }
    } else {
      if (content == CellContent.bomb) {
        return InteractResult.death;
      } else {
        return InteractResult.nothing;
      }
    }
  }

  void checkNeighbors() {
    bombCount = neighbors.where((n) => n.content == CellContent.bomb).length;
  }

  @override
  String toString() {
    if (visibility == CellVisibility.hidden) return "";
    if (flagged == CellFlag.flagged) return "🚩";
    if (content == CellContent.bomb) {
      return "💣";
    } else {
      return bombCount.toString();
    }
  }
}

class Game with ChangeNotifier {
  int forgiveness = 3;
  late List<List<Cell>> grid;
  late int size;
  bool ready = false;
  bool lost = false;
  bool won = false;
  late int bombs;

  void makeMap(int size) {
    lost = false;
    won = false;
    bombs = 0;
    forgiveness = 3;
    this.size = size;
    grid = List.generate(
      size,
      (x) => List.generate(
        size,
        (y) => Cell(
          x: x,
          y: y,
          content:
              (Random().nextInt(101) < 20)
                  ? CellContent.bomb
                  : CellContent.safe,
        ),
      ),
    );

    linker();
  }

  void linker() {
    for (var cells in grid) {
      for (var cell in cells) {
        if (cell.content == CellContent.bomb) bombs++;
        for (int x = -1; x <= 1; x++) {
          for (int y = -1; y <= 1; y++) {
            int xm = cell.x + x;
            int ym = cell.y + y;

            if (x == 0 && y == 0) continue;
            int boundry = grid.length;

            if (xm >= 0 && xm < boundry && ym >= 0 && ym < boundry) {
              cell.neighbors.add(grid[xm][ym]);
            }
          }
        }
        cell.checkNeighbors();
      }
    }
    ready = true;
  }

  void cellInteract({
    required bool isFlagMode,
    required int x,
    required int y,
  }) {
    switch (grid[x][y].interact(isFlagMode: isFlagMode)) {
      case (InteractResult.nothing):
        break;
      case (InteractResult.flagMistake):
        forgiveness--;
        break;
      case (InteractResult.death):
        lose();
        break;
    }
    checkState();
  }

  void lose() {
    lost = true;
    ready = false;
  }

  void checkState() {
    if (forgiveness == 0) {
      lose();
      return;
    }
    int target = size * size;
    int total = 0;
    int flaggedBombs = 0;
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (grid[i][j].content == CellContent.safe &&
            grid[i][j].visibility == CellVisibility.revealed) {
          total++;
        }
        if (grid[i][j].content == CellContent.bomb &&
            grid[i][j].flagged == CellFlag.flagged) {
          flaggedBombs++;
        }
      }
    }

    won = (target == (total + bombs)) || flaggedBombs == bombs;
    if (won) ready = false;
    notifyListeners();
  }
}

class Navigation with ChangeNotifier {
  bool isIntro = true;
  int dif = 0;
  bool hint = false;

  void setDif(int ddd) {
    dif = ddd;
    isIntro = false;
    notifyListeners();
  }

  void unHint() {
    hint = !hint;
    notifyListeners();
  }
}
