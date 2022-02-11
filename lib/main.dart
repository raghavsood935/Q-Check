import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:q_check/Screens/account_pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Home/menu_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(MaterialApp(home: email == null ? Login() : MenuPage()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
