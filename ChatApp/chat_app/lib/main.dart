import 'package:chat_app/Services/Database.dart';
import 'package:chat_app/Services/helperFunctions.dart';
import 'package:chat_app/charRoomScreen.dart';
import 'package:chat_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'LandingPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Chatting app",
    home: LandingPage(),
  ));
}

String myName;

class homePage extends StatefulWidget {
  homePage({Key key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController searchTextEditingControler =
      new TextEditingController();

  DatabaseMethods databaseMethoda = new DatabaseMethods();

  QuerySnapshot searchSnapshot;

  initiateSearch() {
    databaseMethoda
        .getUserByUsername(searchTextEditingControler.text)
        .then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  createChatRoomAndStartConversation(String userName) {
    if (userName != Constants.muName) {
      String chatRoomId = getChatRoomId(userName, Constants.muName);
      List<String> users = [userName, Constants.muName];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatRoomId": chatRoomId
      };

      databaseMethoda.createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConversationScreen(),
          ));
    } else {
      print("you cant message yourself");
    }
  }

  Widget SearchTile({String userName}) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              createChatRoomAndStartConversation(userName);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text("Message"),
            ),
          )
        ],
      ),
    );
  }

  @override
  getUserInfo() async {
    myName = await HelperFunctions.getUserNameSharedPreference();
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.documents.length,
            itemBuilder: (context, index) {
              return SearchTile(
                userName: searchSnapshot.documents[index].data["name"],
              );
            })
        : Container();
  }

  @override
  void initState() {
    initiateSearch();

    super.initState();
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onPressed: _signOut,
            ),
          ],
        ),
        body: Column(
          children: [
            TextField(
              controller: searchTextEditingControler,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.black,
              child: FlatButton(
                onPressed: () {
                  initiateSearch();
                },
                color: Colors.black,
                child: Text(
                  "Search",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            searchList()
          ],
        ));
  }
}

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
