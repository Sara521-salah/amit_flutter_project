import 'package:flutter/material.dart';
class CategoriesDetails extends StatelessWidget {

  int id;
  String name;
  String avater;
  CategoriesDetails(this.name,
      this.id,this.avater);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(avater),
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25
              ),
            )
          ],
        ),
      )
      );
  }
}
