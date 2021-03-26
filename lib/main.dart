import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouseapp/models/user.dart';
import 'package:warehouseapp/screens/services/auth.dart';
import 'package:warehouseapp/screens/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Warehouse',
        debugShowCheckedModeBanner: false,
        // home: JoinScreen(),
        home: Wrapper(),
      ),
    );
  }
}
