import 'package:flutter/material.dart';
import 'package:mental_health_admin/screens/dashboard/dashboard.dart';
import 'package:mental_health_admin/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getBool('loggedin');
 runApp(MyApp(token));}

class MyApp extends StatelessWidget {

  var title = "Login";
  final bool token;
  MyApp(this. token);
  @override
  Widget build(BuildContext context) {
  print(token);
    return MaterialApp(
      title: "$title",
      debugShowCheckedModeBanner: false,
      home:token==null?Home():Dashboard(),
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
    );
  }
}