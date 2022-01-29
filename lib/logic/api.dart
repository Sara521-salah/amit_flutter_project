import 'package:flutter/material.dart';
import 'package:movice/logic/model.dart';
import 'package:movice/model_pro.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyProvider with ChangeNotifier {

  MyProvider(){
    getDataApiCategories();
    getDataApiProducts();
  }
  List<ModelShop> listOfModel = [];
  List<ModelProducts> listOfModelPro = [];

  Future<void> getDataApiProducts() async {
    var url = Uri.parse(
        "https://retail.amit-learning.com/api/products");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["products"];
    print(responseBody);
    //listOfModel.clear();
    for (var i in responseBody) {
      ModelProducts value = ModelProducts(
        currency: i['currency'] ??"Not Found",
        name: i["name"]??"Not Found",
        avatar: i["avatar"]??"Not Found",
        price: i['price'],
        description: i['description'] ?? "Not Found",
        title: i['title']??"Not Found"
      );
      listOfModelPro.add(value);
    }
    notifyListeners();
    print("list====>$listOfModelPro");

  }
  Future<void> getDataApiCategories() async {
    var url = Uri.parse(
        "https://retail.amit-learning.com/api/categories");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["categories"];
    print(responseBody);
    //listOfModel.clear();
    for (var i in responseBody) {
      ModelShop object = ModelShop(
        name: i["name"],
        id: i["id"],
        avatar: i["avatar"],
      );
      listOfModel.add(object);
    }
    notifyListeners();
    print("list====>$listOfModel");

  }





}
