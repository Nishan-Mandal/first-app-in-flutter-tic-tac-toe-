import 'dart:typed_data';

import "package:flutter/material.dart";
import 'package:nearby_connections/nearby_connections.dart';

import 'main.dart';

class chatRoom extends StatefulWidget {
  chatRoom({Key key}) : super(key: key);

  @override
  _chatRoomState createState() => _chatRoomState();
}

class _chatRoomState extends State<chatRoom> {
  final TextEditingController messageControler = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List<String> chatList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.builder(
              controller: _scrollController,
              itemCount: chatList.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 0, bottom: 10),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                // return Container(
                //   padding:
                //       EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 0),
                //   child: Text('${chatList[index]}'),
                //   // child: Align(
                //   //   alignment: (snapshot.data.docs[index]['sender'] ==
                //   //           FirebaseAuth.instance.currentUser.phoneNumber
                //   //       ? Alignment.topRight
                //   //       : Alignment.topLeft),
                //   //   child: Container(
                //   //     decoration: BoxDecoration(
                //   //       borderRadius: BorderRadius.circular(20),
                //   //       color: (snapshot.data.docs[index]['sender'] ==
                //   //               FirebaseAuth.instance.currentUser.phoneNumber
                //   //           ? Colors.blue[200]
                //   //           : Colors.grey.shade200),
                //   //     ),
                //   //     padding: EdgeInsets.all(10),
                //   //     child: Text(
                //   //       " snapshot.data.docs[index]['message']",
                //   //       style: TextStyle(fontSize: 17),
                //   //     ),
                //   //   ),
                //   // ),
                // );
                return ListTile(
                  title: Text('${chatList[index]}'),
                );
              },
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: messageControler,
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          endpointMap.forEach((key, value) {
                  String a = messageControler.text;

                  showSnackbar("Sending $a to ${value.endpointName}, id: $key");
                  Nearby()
                      .sendBytesPayload(key, Uint8List.fromList(a.codeUnits));
                });
                          chatList.add(messageControler.text);
                          messageControler.clear();
                        });
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.blue,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
