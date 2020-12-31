import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "flutter",
    home: homePage(),
  ));
}

var count1 = "";
var count2 = "";
var count3 = "";
var count4 = "";
var count5 = "";
var count6 = "";
var count7 = "";
var count8 = "";
var count9 = "";

var line1;
var line2;
var line3;
var line4;
var line5;
var line6;
var line_d1;
var line_d2;

bool enable = true;
bool ontap = false;

int i = 1;

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with SingleTickerProviderStateMixin {
  // Animation<double> animation;
  // AnimationController animationController;

  // @override
  // void initState() {
  //   super.initState();

  //   animationController =
  //       AnimationController(vsync: this, duration: Duration(seconds: 2));

  //   animation = Tween<double>(begin: 0, end: 100).animate(animationController);

  //   animation.addListener(() {
  //     setState(() {});
  //   });

  //   animationController.forward();
  // }

  AudioCache audio = AudioCache();

  Widget build(BuildContext context) {
    audio.loop("bensound-elevate.mp3");
    audio.play("bensound-elevate.mp3");
    if (count1 == count4 && count4 == count7 && count1 != "") {
      line1 = line1Paint();
      enable = false;
    }
    if (count2 == count5 && count5 == count8 && count2 != "") {
      line2 = line2Paint();
      enable = false;
    }
    if (count3 == count6 && count6 == count9 && count3 != "") {
      line3 = line3Paint();
      enable = false;
    }
    if (count1 == count2 && count2 == count3 && count1 != "") {
      line4 = line4Paint();
      enable = false;
    }
    if (count4 == count5 && count5 == count6 && count4 != "") {
      line5 = line5Paint();
      enable = false;
    }
    if (count7 == count8 && count8 == count9 && count7 != "") {
      line6 = line6Paint();
      enable = false;
    }
    if (count1 == count5 && count5 == count9 && count1 != "") {
      line_d1 = lined1Paint();
      enable = false;
    }
    if (count3 == count5 && count5 == count7 && count3 != "") {
      line_d2 = lined2Paint();
      enable = false;
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/preview.jpeg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Tic Tac Toe"),
          backgroundColor: Colors.blueAccent,
        ),

        // backgroundColor: Colors.teal,

        drawer: Drawer(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.amber,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Nishan Mandal",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    "nishanmandal667@gmail.com",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 17),
              ),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text(
                "Email",
                style: TextStyle(fontSize: 17),
              ),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 17),
              ),
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text(
                "Feedback",
                style: TextStyle(fontSize: 17),
              ),
              trailing: Icon(Icons.send),
            )
          ],
        )),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 110,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
// column-----1

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                          painter: line1,
                        ),
                        CustomPaint(
                          painter: line2,
                        ),
                        CustomPaint(
                          painter: line3,
                        ),
                        CustomPaint(
                          painter: line4,
                        ),
                        CustomPaint(
                          painter: line5,
                        ),
                        CustomPaint(
                          painter: line6,
                        ),
                        CustomPaint(
                          painter: line_d1,
                        ),
                        CustomPaint(
                          painter: line_d2,
                        ),
                        SizedBox(
                          height: 83,
                          width: 83,
                          child: GestureDetector(
                            child: Text(
                              count1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 70,
                                color: Colors.amber,
                                fontFamily: "FingerPaint",
                              ),
                            ),
                            onTap: () {
                              if (i % 2 == 0 && count1 == "") {
                                count1 = "X";
                                i++;
                              } else if (count1 == "") {
                                count1 = "O";
                                i++;
                              }
                              if (enable) {
                                setState(() {});
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 83,
                          width: 83,
                          child: GestureDetector(
                            // color: Colors.blueGrey,
                            onTap: () {
                              if (i % 2 == 0 && count2 == "") {
                                count2 = "X";
                                i++;
                              } else if (count2 == "") {
                                count2 = "O";
                                i++;
                              }

                              if (enable) {
                                setState(() {});
                              }
                            },

                            child: Text(
                              count2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.amber,
                                  fontFamily: "FingerPaint"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 83,
                          width: 83,
                          child: GestureDetector(
                            //  color: Colors.blueGrey,
                            onTap: () {
                              if (i % 2 == 0 && count3 == "") {
                                count3 = "X";
                                i++;
                              } else if (count3 == "") {
                                count3 = "O";
                                i++;
                              }

                              if (enable) {
                                setState(() {});
                              }
                            },
                            child: Text(
                              count3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.amber,
                                  fontFamily: "FingerPaint"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
// next column--2

                    SizedBox(
                      width: 05,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 83,
                          width: 83,
                          child: GestureDetector(
                            onTap: () {
                              if (i % 2 == 0 && count4 == "") {
                                count4 = "X";
                                i++;
                              } else if (count4 == "") {
                                count4 = "O";
                                i++;
                              }

                              if (enable) {
                                setState(() {});
                              }
                            },
                            child: Text(
                              count4,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 70,
                                color: Colors.amber,
                                fontFamily: "FingerPaint",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 83,
                          width: 83,
                          child: GestureDetector(
                            // color: Colors.blueGrey,
                            onTap: () {
                              if (i % 2 == 0 && count5 == "") {
                                count5 = "X";
                                i++;
                              } else if (count5 == "") {
                                count5 = "O";
                                i++;
                              }

                              if (enable) {
                                setState(() {});
                              }
                            },

                            child: Text(
                              count5,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.amber,
                                  fontFamily: "FingerPaint"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 83,
                          width: 83,
                          child: GestureDetector(
                            //  color: Colors.blueGrey,
                            onTap: () {
                              if (i % 2 == 0 && count6 == "") {
                                count6 = "X";
                                i++;
                              } else if (count6 == "") {
                                count6 = "O";
                                i++;
                              }

                              if (enable) {
                                setState(() {});
                              }
                            },
                            child: Text(
                              count6,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.amber,
                                  fontFamily: "FingerPaint"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
// next column--3

                    SizedBox(
                      width: 05,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 83,
                          width: 83,
                          child: GestureDetector(
                            onTap: () {
                              if (i % 2 == 0 && count7 == "") {
                                count7 = "X";
                                i++;
                              } else if (count7 == "") {
                                count7 = "O";
                                i++;
                              }

                              if (enable) {
                                setState(() {});
                              }
                            },
                            child: Text(
                              count7,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 70,
                                color: Colors.amber,
                                fontFamily: "FingerPaint",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 83,
                          width: 83,
                          child: GestureDetector(
                            // color: Colors.blueGrey,
                            onTap: () {
                              if (i % 2 == 0 && count8 == "") {
                                count8 = "X";
                                i++;
                              } else if (count8 == "") {
                                count8 = "O";
                                i++;
                              }

                              if (enable) {
                                setState(() {});
                              }
                            },

                            child: Text(
                              count8,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.amber,
                                  fontFamily: "FingerPaint"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 83,
                          width: 83,
                          child: GestureDetector(
                            //  color: Colors.blueGrey,
                            onTap: () {
                              if (i % 2 == 0 && count9 == "") {
                                count9 = "X";
                                i++;
                              } else if (count9 == "") {
                                count9 = "O";
                                i++;
                              }
                              if (enable) {
                                setState(() {});
                              }
                            },
                            child: Text(
                              count9,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.amber,
                                  fontFamily: "FingerPaint"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  enable = true;

                  setState(() {
                    count1 = "";
                    count2 = "";
                    count3 = "";
                    count4 = "";
                    count5 = "";
                    count6 = "";
                    count7 = "";
                    count8 = "";
                    count9 = "";

                    line1 = null;
                    line2 = null;
                    line3 = null;
                    line4 = null;
                    line5 = null;
                    line6 = null;
                    line_d1 = null;
                    line_d2 = null;

                    i = 1;
                  });
                },
                child: Container(
                  width: 110,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 20),
                            blurRadius: 30,
                            color: Colors.black12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22)),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(95),
                                topLeft: Radius.circular(95),
                                bottomRight: Radius.circular(200))),
                      ),
                      Icon(
                        Icons.replay_rounded,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class line1Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(-35, 55), Offset(210, 55), linepaint);
  }

  @override
  bool shouldRepaint(line1Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line1Paint oldDelegate) => false;
}

class line2Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(-35, 145), Offset(210, 145), linepaint);
  }

  @override
  bool shouldRepaint(line2Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line2Paint oldDelegate) => false;
}

class line3Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(-35, 230), Offset(210, 230), linepaint);
  }

  @override
  bool shouldRepaint(line3Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line3Paint oldDelegate) => false;
}

class line4Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, 20), Offset(0, 270), linepaint);
  }

  @override
  bool shouldRepaint(line4Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line4Paint oldDelegate) => false;
}

class line5Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(87, 20), Offset(87, 270), linepaint);
  }

  @override
  bool shouldRepaint(line5Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line5Paint oldDelegate) => false;
}

class line6Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(175, 20), Offset(175, 270), linepaint);
  }

  @override
  bool shouldRepaint(line6Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line6Paint oldDelegate) => false;
}

class lined1Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(-20, 30), Offset(200, 260), linepaint);
  }

  @override
  bool shouldRepaint(lined1Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(lined1Paint oldDelegate) => false;
}

class lined2Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(200, 30), Offset(-20, 260), linepaint);
  }

  @override
  bool shouldRepaint(lined2Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(lined2Paint oldDelegate) => false;
}
