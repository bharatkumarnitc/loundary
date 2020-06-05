import 'package:flutter/material.dart';
import '../Widget/AppDrawer.dart';
import '../Widget/usermainpage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: UserMainpage(),
      drawer: AppDrawer(),


    );
  }
}
