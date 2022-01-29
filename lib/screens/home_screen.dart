import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movice/logic/api.dart';
import 'package:movice/logic/model.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:test_provider/main.dart' as prefix;
import '../constant.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories'
        ),
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: Consumer<MyProvider>(
          builder: (context, model, child) {
        if(model.listOfModel.isEmpty){
          return const Center(
            child: CircularProgressIndicator(
              color: colorAmber,
            ),
          );
        }else
          {
            return GridView.builder(
              itemCount: model.listOfModel.length,
              itemBuilder: (BuildContext context, int index) =>
                  BuildCardItem(context, model.listOfModel[index]),
               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
              );
          }
      }),
    );
  }
  // ignore: non_constant_identifier_names
  BuildCardItem(BuildContext context,ModelShop modelShop){
    return Card(
      elevation: 10,
      child: Column(
        children: [
          Image.network(
            modelShop.avatar,
            height: 80,
            fit: BoxFit.cover,
          ),
          Text(
            modelShop.name,
            style: const TextStyle(
              color: Colors.teal,

            ),
          )
        ],
      ),
    );

  }
}
