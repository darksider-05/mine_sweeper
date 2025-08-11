import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themes with ChangeNotifier {
  Color bg = const Color(0xFFFF5722);
  Color bgi = const Color(0x73FFEB3B);
  Color btn = const Color(0xFFFFB300);
  Color txt = const Color(0x73000000);
  Color passout = const Color(0x1FFFFFFF);

  static const String _themeKey = 'selectedTheme';

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString(_themeKey) ?? 'yellow';
    _applyTheme(themeName);
  }

  Future<void> _saveTheme(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, name);
  }

  void _applyTheme(String name) {
    switch (name) {
      case 'yellow':
        setYellow(save: false);
        break;
      case 'purple':
        setPurple(save: false);
        break;
      case 'black':
        setBlack(save: false);
        break;
      case 'white':
        setWhite(save: false);
        break;
      case 'green':
        setGreen(save: false);
        break;
      case 'python':
        setPython(save: false);
        break;
      case 'pink':
        setPink(save: false);
        break;
      default:
        setBlack(save: false);
    }
  }

  // Modified theme setters with optional saving
  void setYellow({bool save = true}) {
    bg = const Color(0xFFFF5722);
    bgi = const Color(0x73FFEB3B);
    btn = const Color(0xFFFFB300);
    txt = const Color(0x73000000);
    passout = const Color(0x1FFFFFFF);
    notifyListeners();
    if (save) _saveTheme('yellow');
  }

  void setPurple({bool save = true}) {
    bg = const Color(0xFF512DA8);
    bgi = const Color(0xFF009688);
    btn = const Color(0xFF00BCD4);
    txt = const Color(0xB3FFFFFF);
    passout = const Color(0x1FFFFFFF);
    notifyListeners();
    if (save) _saveTheme('purple');
  }

  void setBlack({bool save = true}) {
    bg = const Color(0xDD000000);
    bgi = const Color(0x62FFFFFF);
    btn = const Color(0x1AFFFFFF);
    txt = const Color(0xFFFFFFFF);
    passout = const Color(0x1FFFFFFF);
    notifyListeners();
    if (save) _saveTheme('black');
  }

  void setWhite({bool save = true}) {
    bg = const Color(0xFFFFFFFF);
    bgi = const Color(0x1F000000);
    btn = const Color(0x1F000000);
    txt = const Color(0xFF000000);
    passout = const Color(0x1F000000);
    notifyListeners();
    if (save) _saveTheme('white');
  }

  void setGreen({bool save = true}) {
    bg = const Color(0xFF388E3C);
    bgi = const Color(0x1F000000);
    btn = const Color(0x1F000000);
    txt = const Color(0xFFFFEB3B);
    passout = const Color(0x1F000000);
    notifyListeners();
    if (save) _saveTheme('green');
  }

  void setPython({bool save = true}) {
    bg = const Color(0xFF00023D);
    bgi = const Color(0xFF000482);
    btn = const Color(0xFF000C7B);
    txt = const Color(0xFFFFEB3B);
    passout = const Color(0xFF00796B);
    notifyListeners();
    if (save) _saveTheme('python');
  }

  void setPink({bool save = true}) {
    bg = const Color(0xFFBD2789);
    bgi = const Color(0xFF7D0EC3);
    btn = const Color(0xFFA911D5);
    txt = const Color(0xFFFFEB3B);
    passout = const Color(0xFF5E35B1);
    notifyListeners();
    if (save) _saveTheme('pink');
  }
}