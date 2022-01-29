import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movice/on_boarding.dart';


class MainSplash extends StatefulWidget {
  //const MainSplash({Key key}) : super(key: key);

  @override
  _MainSplashState createState() => _MainSplashState();
}

class _MainSplashState extends State<MainSplash> {
  @override
  Widget build(BuildContext context) {
    return   AnimatedSplashScreen(

            splash: const Image(
              image: AssetImage("assets/images/logo.png"),
              width: 120,
              height: 10,
            ),
            nextScreen: const OnBoardingScreen(),
            splashTransition: SplashTransition.rotationTransition,
            backgroundColor: Colors.white,


    );
  }
}
