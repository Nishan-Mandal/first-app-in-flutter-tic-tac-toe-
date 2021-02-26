import 'package:flutter/material.dart';
import 'package:Tic_Tac_Toe/settings.dart';
import 'settings.dart';

class drawer extends StatefulWidget {
  drawer({Key key}) : super(key: key);

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.teal,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('PicsArt_01-01-08.21.28.jpg'),
                          fit: BoxFit.fill)),
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
            onTap: () {
              // ignore: missing_return
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => settings(),
                  ));
            },
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
    );
  }
}
