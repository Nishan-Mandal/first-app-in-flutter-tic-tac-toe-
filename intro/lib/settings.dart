import 'package:flutter/material.dart';
import 'package:Tic_Tac_Toe/main.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

double max_sound = 1.0;
bool off1 = true;
bool off2 = true;

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
          child: Container(
        color: Colors.lime,
        child: Column(
          children: [
            Text(
              "Sounds",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Row(children: [
              Text(
                "Music   ",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              LiteRollingSwitch(
                value: true,
                textOn: "On",
                textOff: "Off",
                colorOn: Colors.greenAccent,
                colorOff: Colors.redAccent,
                iconOn: Icons.music_note,
                iconOff: Icons.music_off,
                textSize: 20,
                animationDuration: const Duration(milliseconds: 300),
                onChanged: (bool state) {
                  if (off1) {
                    plr.resume();
                    off1 = false;
                  } else {
                    plr.pause();
                    off1 = true;
                  }
                },
              ),
            ]),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
