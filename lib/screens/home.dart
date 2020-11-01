import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Your own personal chat app'),
          backgroundColor: Colors.black,
          leading: Icon(
            Icons.supervised_user_circle,
          )),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/chat.gif"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.black,
                elevation: 10,
                child: MaterialButton(
                  minWidth: 400,
                  height: 40,
                  child: Text('Sign up'),
                  onPressed: () {
                    Navigator.pushNamed(context, "reg");
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Material(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.black,
                elevation: 10,
                child: MaterialButton(
                  minWidth: 400,
                  height: 40,
                  child: Text('Sign in'),
                  onPressed: () {
                    Navigator.pushNamed(context, "login");
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
