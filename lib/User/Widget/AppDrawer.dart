import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("Bhart.rock@gmail.com"),
            accountName: Text("Bharat"),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage('assets/placeholder.jpg'),
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
        ],
      ),
    );
  }
}
