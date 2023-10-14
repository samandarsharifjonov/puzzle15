import 'package:flutter/material.dart';

class Win extends StatefulWidget {
  const Win({super.key});

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Column(
        children: [
          Center(
            child: Text("You win"),
          )
        ],
      ),
    );
  }
}
