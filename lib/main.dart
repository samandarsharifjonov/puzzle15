import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluzze15/widgets/home.dart';
import 'package:pluzze15/widgets/puzzle.dart';
main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Home(),
    );
  }
}
