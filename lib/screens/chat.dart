import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

var msg;

class _MyChatState extends State<MyChat> {
  var msgtextcontroller = TextEditingController();

  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    var signInUser = authc.currentUser.email;
    setState(() {
      msg;
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chat home"),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Icon(
                Icons.location_searching_sharp,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "map");
              },
            ),
          ],
        ),
        body: Container(
          height: deviceHeight * 1,
          width: deviceWidth * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/talk.gif"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                child: StreamBuilder<QuerySnapshot>(
                  builder: (context, snapshot) {
                    print("new data comes");
                    msg = snapshot.data.docs;

                    List<Widget> y = [];
                    for (var d in msg) {
                      var msgText = d.data()['text'];
                      var msgSender = d.data()['sender'];
                      var msgWidget = Text("$msgText : $msgSender");
                      y.add(msgWidget);
                    }
                    print(y);
                    return Container(
                      child: Column(
                        children: y,
                      ),
                    );
                  },
                  stream: fs.collection("chat").snapshots(),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 500, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Msg.......",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () async {
                        await fs.collection("chat").add(
                          {
                            "text": msg,
                            "sender": signInUser,
                          },
                        );
                      },
                    ),
                  ),
                  onChanged: (value) {
                    msg = value;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
