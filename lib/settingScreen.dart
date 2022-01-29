import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
       backgroundColor: Colors.teal,
       title: Text(
         'Setting'
       ),
      ),
      body:  Center(
        child: Text("Setting Screen"),
      ),
    );
  }
}
