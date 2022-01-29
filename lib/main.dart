import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movice/categories.dart';
import 'package:movice/logic/api.dart';
import 'package:movice/on_boarding.dart';
import 'package:movice/registerScreen.dart';
import 'package:movice/screens/home_screen.dart';
import 'package:movice/splash_screen.dart';
import 'package:provider/provider.dart';

import 'goto.dart';
import 'home_layhout.dart';
import 'loginScreen.dart';
main(){
  runApp(Movices());
}
class Movices extends StatelessWidget {
  const Movices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      routes: {
        'Login':(context)=>LoginScreen(),
        'RegisterScreen':(context)=>RegisterScreen(),
        'Categories':(context)=>Categories(),
        'HomeLayout':(context)=>HomeLayout(),
      },
      // routes: {
      //   "GoTo":(context)=>GoTo()
      // },
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
      ),
      title: "Shop",
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (BuildContext context)=>MyProvider(),
          child:  MainSplash()),
    );
  }
}
