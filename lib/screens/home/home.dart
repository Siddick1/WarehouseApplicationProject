import 'package:flutter/material.dart';
import 'package:warehouseapp/screens/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(elevation: 0.0, title: Text("Warehouse"), actions: <Widget>[
        TextButton.icon(
          icon: Icon(Icons.person),
          label: Text('logout'),
          onPressed: () async {
            await _auth.signOut();
          },
        ),
      ]),
      body: Center(
        child: Text('Welcome to the warehouse app'),
      ),
    );
  }
}
