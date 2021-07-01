import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Fake Phone off",
    home: homePage(),
  ));
}

class homePage extends StatefulWidget {
  homePage({Key key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Future<void> click() async {
    print("hiiii");
  }

  String _latestHardwareButtonEvent;

  StreamSubscription<HardwareButtons.VolumeButtonEvent>
      _volumeButtonSubscription;
  StreamSubscription<HardwareButtons.HomeButtonEvent> _homeButtonSubscription;
  StreamSubscription<HardwareButtons.LockButtonEvent> _lockButtonSubscription;

  @override
  void initState() {
    super.initState();
    _volumeButtonSubscription =
        HardwareButtons.volumeButtonEvents.listen((event) {
      setState(() {
        _latestHardwareButtonEvent = event.toString();
      });
    });

    _homeButtonSubscription = HardwareButtons.homeButtonEvents.listen((event) {
      setState(() {
        _latestHardwareButtonEvent = 'HOME_BUTTON';
      });
    });

    _lockButtonSubscription = HardwareButtons.lockButtonEvents.listen((event) {
      setState(() {
        _latestHardwareButtonEvent = 'LOCK_BUTTON';
        print(_latestHardwareButtonEvent);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _volumeButtonSubscription?.cancel();
    _homeButtonSubscription?.cancel();
    _lockButtonSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Fake Phone Off"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: TextField(
                        // obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'HRS',
                          filled: true,
                          fillColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ":",
                  ),
                  Flexible(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'MIN',
                          filled: true,
                          fillColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 120,
                width: 120,
                child: RaisedButton(
                  child: Text(
                    'Value: $_latestHardwareButtonEvent',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {},
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              Text('Value: $_latestHardwareButtonEvent\n'),
            ],
          ),
        ));
  }
}

// class homePage extends StatelessWidget {
//   const homePage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Fake Phone Off"),
//         backgroundColor: Colors.blueAccent,
//       ),
//     );
//   }
// }
