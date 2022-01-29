import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movice/categories_details.dart';
import 'package:movice/logic/api.dart';
import 'package:movice/logic/model.dart';
import 'package:movice/model_pro.dart';
import 'package:movice/products_details.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:test_provider/main.dart' as prefix;
import '../constant.dart';
class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
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
              if(model1.listOfModelPro.isEmpty){
                return const Center(
                  child: CircularProgressIndicator(
                    color: colorAmber,
                  ),
                );
              }else
              {

                return GridView.builder(
                  itemCount: model1.listOfModelPro.length,
                  itemBuilder: (BuildContext context, int index) =>
                      BuildCardItem1(context, model1.listOfModelPro[index], onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return ProductsDetails(
                            currency: model1.listOfModelPro[index].currency,
                            description: model1.listOfModelPro[index].description,
                            title: model1.listOfModelPro[index].title,
                            avater: model1.listOfModelPro[index].avatar,
                            name: model1.listOfModelPro[index].name,
                            price: model1.listOfModelPro[index].price,

                          );
                        }));

                      }),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 3.2,
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
  BuildCardItem1(BuildContext context,ModelProducts modelShoprp,{required onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        elevation: 10,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                modelShoprp.avatar,
                fit: BoxFit.cover,
                height: 110,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '${modelShoprp.title}',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
}

