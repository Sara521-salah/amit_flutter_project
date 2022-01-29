import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movice/categories_details.dart';
import 'package:movice/logic/api.dart';
import 'package:movice/logic/model.dart';
import 'package:movice/model_pro.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:test_provider/main.dart' as prefix;
import '../constant.dart';
class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<MyProvider>(
            builder: (context, model1, child) {
              if(model1.listOfModel.isEmpty){
                return const Center(
                  child: CircularProgressIndicator(
                    color: colorAmber,
                  ),
                );
              }else
              {

                return GridView.builder(
                  itemCount: model1.listOfModel.length,
                  itemBuilder: (BuildContext context, int index) =>
                      BuildCardItem1(context, model1.listOfModel[index], onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return CategoriesDetails(
                              model1.listOfModel[index].name,
                          model1.listOfModel[index].id,
                              model1.listOfModel[index].avatar);
                        }));

                      }),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 2.9,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                );
              }
            }),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  BuildCardItem1(BuildContext context,ModelShop modelShop,{required onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 10,
        child: Column(
          children: [
            Image.network(
              modelShop.avatar,
              fit: BoxFit.cover,
              height: 110,
            ),
              Text(
                '${modelShop.name}',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20
                ),
              ),

          ],
        ),
      ),
    );

  }
}
