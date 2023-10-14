import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluzze15/widgets/win.dart';



class Puzzle15State extends StatefulWidget {
  const Puzzle15State({super.key});

  static int white1 = 0;

  @override
  State<Puzzle15State> createState() => _Puzzle15StateState();
}

class _Puzzle15StateState extends State<Puzzle15State> {
  List<int> list = List.generate(16, (index) => index + 1)..shuffle();
  int count = 0;
  bool scoreBool = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Color(0xffFDF8F2),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    count = 0;
                    list..shuffle();
                  });
                },
                child: Text("Shuffle",
                    style: TextStyle(
                        color: Color(0xff0b76B4),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
              Text(

                "15 Puzzle",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),


              TextButton(
                onPressed: () {},
                child: Text("Option",
                    style: TextStyle(
                        color: Color(0xff0b76B4),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xffFDF8F2),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 70.0),
                child: Column(
                  children: [
                    Text(
                      "Place the tiles in order and you win\n"
                      "Shuffle to start a new game ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xff88827C)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Score: ${count}",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xffBFAD9F),
                      borderRadius: BorderRadius.circular(8)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      int x = index % 4;
                      int y = index ~/ 4;

                      return Padding(
                          padding: EdgeInsets.only(
                              left: x == 0 ? 8 : 4,
                              right: x == 3 ? 8 : 4,
                              top: y == 0 ? 8 : 4,
                              bottom: y == 3 ? 8 : 4),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: list[index] != 16
                                  ? Color(0xffE6D5CB)
                                  : Color(0xffCDBAAC),
                            ),
                            child: list[index] != 16
                                ? MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        if (index % 4 != 3 &&
                                            list[index + 1] == 16) {
                                          print(count++);
                                          //right
                                          list[index + 1] = list[index];
                                          list[index] = 16;
                                        } else if (index % 4 != 0 &&
                                            list[index - 1] == 16) {
                                          print(count++);
                                          //left
                                          list[index - 1] = list[index];
                                          list[index] = 16;
                                        } else if (index ~/ 4 != 0 &&
                                            list[index - 4] == 16) {
                                          print(count++);

                                          list[index - 4] = list[index];
                                          list[index] = 16;
                                        } else if (index ~/ 4 != 3 &&
                                            list[index + 4] == 16) {
                                          print(count++);

                                          list[index + 4] = list[index];
                                          list[index] = 16;
                                        }
                                        if(isWin()){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Win()));
                                        }
                                      }


                                      );
                                    },
                                    child: Text(
                                      "${list[index] != 16 ? list[index] : ""}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "${list[index] != 16 ? list[index] : ""}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                          ));
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
  isWin(){
    int k = 16;
     for(int i = 0; i < list.length-1; i++){
       if(list[i] != i + 1){
         k++;
       }
     }
     return k == 0;
  }
}
