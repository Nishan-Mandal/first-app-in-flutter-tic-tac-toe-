import 'package:chat_app/Services/Database.dart';
import 'package:chat_app/Services/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  // HelperFunctions heelperFunction = new HelperFunctions();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController userNameControler = new TextEditingController();

  Future<void> _signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  signUp() {
    if (formKey.currentState.validate()) {
      _signInAnonymously();
      Map<String, String> userInfoMap = {"name": userNameControler.text};
      databaseMethods.uploadUserInfo(userInfoMap);

      HelperFunctions.saveUserNameSharedPreference(userNameControler.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body:
          /*isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : */
          Center(
              child: Column(
        children: [
          Form(
            key: formKey,
            child: Flexible(
              child: TextFormField(
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
                validator: (value) {
                  return value.isEmpty ? "Please provide UserName" : null;
                },
                controller: userNameControler,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            child: Text('Sign in anonymously'),
            onPressed: () {
              signUp();
            },
          ),
        ],
      )),
    );
  }
}
