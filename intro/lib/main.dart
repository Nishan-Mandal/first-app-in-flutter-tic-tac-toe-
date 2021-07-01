// import 'dart:html';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:Tic_Tac_Toe/drawer.dart';
import 'package:Tic_Tac_Toe/settings.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Tic Tac toe",
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
bool play = true;

int point1 = 0;
int point2 = 0;
String x = "0";
String o = "0";

int i = 1;
int temp_click_sound = i;

var turn = 'O';
var win_text = "Turn";
var win_char = 'X';

var clr = Colors.lime;

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

AudioPlayer plr = AudioPlayer();

AudioCache bg_music = AudioCache(fixedPlayer: plr);
AudioCache player = AudioCache();

class _homePageState extends State<homePage> {
  Widget build(BuildContext context) {
    Future<void> click() async {
      player.play("click.mp3", volume: 100);
    }

    Future<void> win_sound() async {
      player.play("Ta Da-SoundBible.com-1884170640.mp3");
    }

    Future<void> background_audio() async {
      plr = await bg_music.loop("bensound-elevate.mp3", volume: 0.5);
    }

    Future<void> stop_audios() async {
      plr.stop();
    }

    if (play) {
      background_audio();
      play = false;
    }

    if (i % 2 != 0) {
      click();
      turn = 'O';
      win_char = 'X';
    } else if (i % 2 == 0) {
      click();
      turn = 'X';
      win_char = 'O';
    }

    if (count1 == count4 && count4 == count7 && count1 != "") {
      line1 = line1Paint();
      enable = false;
      win_text = "Won";
    }
    if (count2 == count5 && count5 == count8 && count2 != "") {
      line2 = line2Paint();
      enable = false;
      win_text = "Won";
    }
    if (count3 == count6 && count6 == count9 && count3 != "") {
      line3 = line3Paint();
      enable = false;
      win_text = "Won";
    }
    if (count1 == count2 && count2 == count3 && count1 != "") {
      line4 = line4Paint();
      enable = false;
      win_text = "Won";
    }
    if (count4 == count5 && count5 == count6 && count4 != "") {
      line5 = line5Paint();
      enable = false;
      win_text = "Won";
    }
    if (count7 == count8 && count8 == count9 && count7 != "") {
      line6 = line6Paint();
      enable = false;
      win_text = "Won";
    }
    if (count1 == count5 && count5 == count9 && count1 != "") {
      line_d1 = lined1Paint();
      enable = false;
      win_text = "Won";
    }
    if (count3 == count5 && count5 == count7 && count3 != "") {
      line_d2 = lined2Paint();
      enable = false;
      win_text = "Won";
    }

    if (win_text == "Won") {
      turn = win_char;
      clr = Colors.orange;

      win_sound();
      if (win_char == 'X') {
        point1++;
        x = point1.toString();
      } else if (win_char == 'O') {
        point2++;
        o = point2.toString();
      }
    }

    if (i > temp_click_sound) {
      temp_click_sound = i;
    }

    Future<bool> onBackPress() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          title: Text("   Do you want to exit ?"),
          backgroundColor: Colors.amber[300],
          actions: [
            FlatButton(
              child: Text("No"),
              onPressed: () => Navigator.pop(context, false),
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: () {
                stop_audios();
                Navigator.pop(context, true);
              },
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: onBackPress,
      child: Container(
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

          drawer: drawer(),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 50,
                      // color: Colors.grey,
                      child: Text(
                        " X>",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.tealAccent),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      // color: Colors.grey,
                      child: Text(
                        x,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 210,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      // color: Colors.grey,
                      child: Text(
                        o,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 40,
                      // color: Colors.grey,
                      child: Text(
                        "<O",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.tealAccent),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: Text(
                    "  " + turn + " " + win_text,
                    style: TextStyle(
                        color: clr,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "FingerPaint"),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // column-----1

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            height: 25,
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
                            height: 25,
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
                        width: 5,
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
                            height: 25,
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
                            height: 25,
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
                            height: 25,
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
                            height: 25,
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
                  height: 70,
                ),
                InkWell(
                  onLongPress: () {
                    enable = true;
                    setState(() {
                      player.play("on longpress sound (restart button).mp3");
                      player.load("on longpress sound (restart button).mp3");
                      player.load("click.mp3");
                      player.load("Ta Da-SoundBible.com-1884170640.mp3");

                      point1 = 0;
                      point2 = 0;

                      x = point1.toString();
                      o = point2.toString();

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
                      temp_click_sound = i;
                      win_text = "Turn";
                      clr = Colors.lime;
                    });
                  },
                  onTap: () {
                    enable = true;

                    setState(() {
                      player.play("ontap sound (restart button).mp3");
                      player.load("ontap sound (restart button).mp3");
                      player.load("click.mp3");
                      player.load("Ta Da-SoundBible.com-1884170640.mp3");
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

                      win_text = "Turn";
                      clr = Colors.lime;
                    });
                  },
                  child: Container(
                    width: 110,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 0,
                              color: Colors.black54)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 80,
                          padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                          child: Text(
                            "Reset",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(90),
                                  topLeft: Radius.circular(90),
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
      ),
    );
  }
}

//top horizontal
class line1Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(-35, 55), Offset(280, 55), linepaint);
  }

  @override
  bool shouldRepaint(line1Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line1Paint oldDelegate) => false;
}

// center horizontal
class line2Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(-35, 165), Offset(280, 165), linepaint);
  }

  @override
  bool shouldRepaint(line2Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line2Paint oldDelegate) => false;
}

//bottom horizontal
class line3Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(-35, 270), Offset(280, 270), linepaint);
  }

  @override
  bool shouldRepaint(line3Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line3Paint oldDelegate) => false;
}

//left verticle
class line4Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, 0), Offset(0, 325), linepaint);
  }

  @override
  bool shouldRepaint(line4Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line4Paint oldDelegate) => false;
}

//center verticle
class line5Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(120, 0), Offset(120, 325), linepaint);
  }

  @override
  bool shouldRepaint(line5Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line5Paint oldDelegate) => false;
}

//left verticle
//
class line6Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(240, 0), Offset(240, 325), linepaint);
  }

  @override
  bool shouldRepaint(line6Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(line6Paint oldDelegate) => false;
}

// "\"
class lined1Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(-40, 10), Offset(280, 310), linepaint);
  }

  @override
  bool shouldRepaint(lined1Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(lined1Paint oldDelegate) => false;
}

// "/"
class lined2Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;
    linepaint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(280, 10), Offset(-40, 320), linepaint);
  }

  @override
  bool shouldRepaint(lined2Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(lined2Paint oldDelegate) => false;
}
