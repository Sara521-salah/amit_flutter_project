import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.teal,
              title: const Text(
                  'Setting'
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name:Sara',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,)
                      ),
                      Text('Email: sara@gmail.com',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,)
                      ),
                      const Text('Phone:0156473',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,)
                      ),
                    ]
                )
            )
        )
    );
  }
}
