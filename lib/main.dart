import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './User/Screens/home.dart';
import 'User/Screens/login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  child: Text('Admin'),
                  value: 'one',
                ),
                DropdownMenuItem<String>(
                  child: Text('ShopKepper'),
                  value: 'two',
                ),
                DropdownMenuItem<String>(
                  child: Text('User'),
                  value: 'three',
                ),
              ],
              onChanged: (String value) {
                setState(() {
                  _value = value;
                });
              },
              hint: Text('Select Item'),
              value: _value,
            ),
            RaisedButton(onPressed: choose,child: Text("Choose"),)
          ],
        ),
      ),
    );
  }

  void choose() {
    if (_value == "three") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StreamBuilder(
          stream: _auth.onAuthStateChanged,
          builder: (ctx, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.hasData) {
              FirebaseUser user = snapshot.data;
              if (user != null) {
                return HomePage();
              } else {
                return SignInScreen();
              }
            }

            return SignInScreen();
          })
      )
      );
    } else if (_value == "ShopKepper") {
    } else if (_value == "Admin") {}
  }
}
