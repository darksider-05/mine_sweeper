import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/logic.dart';

class WinPage extends StatelessWidget {
  const WinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = context.watch<Basic>();

    return Container(
      decoration: BoxDecoration(color: Colors.purple,),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(75),color: Colors.yellow,),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(120),color: Colors.red,),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(250),color: Colors.cyan,),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width),
                  Text("🎉 you won! 🎉", style: TextStyle(fontSize: 25, color: Colors.black)),
                  ElevatedButton(
                    onPressed: (){
                      basic.goBack();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.green),
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
            ),
          ),
        ),
      ),
    );
  }
}
