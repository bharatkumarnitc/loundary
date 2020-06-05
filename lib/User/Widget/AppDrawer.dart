import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _user;

  final Firestore _db = Firestore.instance;

  @override
  void initState() {
    fetechUserData();

    super.initState();
  }

  void fetechUserData() async {
    FirebaseUser u = await _auth.currentUser();
    setState(() {
      _user = u;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:_user!=null? Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(_user.email),
            accountName: Text(_user.displayName),
            decoration: BoxDecoration(

                image: DecorationImage(
              image: NetworkImage(_user.photoUrl),
              fit: BoxFit.cover,
            )
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Profile'),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: ()
            {
              _auth.signOut();

            },
          ),

        ],
      ):LinearProgressIndicator(),
    );
  }
}
