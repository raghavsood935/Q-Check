import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF104E0B)),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            child: SizedBox(
              child: Image(
                image: AssetImage("assets/images/splash_leaf1.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 80),
            child: Container(
              height: 110.0,
              width: 110.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image(
                image: AssetImage("assets/images/splash_logo.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 40, 0, 5),
            child: SizedBox(
              child: Image(image: AssetImage("assets/images/splash_leaf2.png")),
            ),
          ),
        ]),
      ),
    );
  }
}
