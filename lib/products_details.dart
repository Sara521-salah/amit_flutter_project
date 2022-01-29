import 'package:flutter/material.dart';

class ProductsDetails extends StatelessWidget {
  String title;
  String name;
  String avater;
  String currency;
  int price;
  String description;
  ProductsDetails(
      {required this.name,
      required this.description,
     required this.avater,
     required this.title,
     required this.currency,
     required this.price});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          elevation: 0,
          backgroundColor: Colors.teal,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(avater),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                children: [
                  Text(
                    '${price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 2,),
                  Text(
                    '${currency}',
                    style: TextStyle(
                      color: Colors.red
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description
              ),
            )
          ],
        ));
  }
}
