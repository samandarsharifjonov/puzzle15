import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pluzze15/widgets/puzzle.dart';
import 'package:shimmer_animation/shimmer_animation.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  @override

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void initState() {
    var initState = super.initState();
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Puzzle15State() ));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer(
        direction: ShimmerDirection.fromLTRB(),
        color: Colors.white,
        child: Container(
          color: Color(0xff4e7bd9),
          child: Column(
            children: [
              SizedBox(
                height: 350,
              ),
              Center(
                child: Text("Puzzle 15 Game",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,

                ),
                )
              ),

              SizedBox(
                height: 100,
              ),

              Center(
                child:  Container(

                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: Color(0xff4e7bd9),
                      size: 32,
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
