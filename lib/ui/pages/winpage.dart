import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/logic.dart';

class WinPage extends StatelessWidget {
  const WinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = context.watch<Basic>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          Text("🎉 you won! 🎉", style: TextStyle(fontSize: 25)),
          ElevatedButton(
            onPressed: (){
              basic.goBack();
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white38),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            child: Text(
              "Go Back",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
