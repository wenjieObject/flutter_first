import 'package:flutter/material.dart';
import '../services/product.dart';
import 'home_banner.dart';
import '../model/product.dart';
import 'home_product_page.dart';
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductItemModal> list = List<ProductItemModal>();

  void getProductList() {

   var tmp=products["items"];
    
   
   var lsit= json.decode(json.encode(tmp));
    
    var productList=  ProductListModal.fromJson(lsit);
     
  
    setState(() {
      list.addAll(productList.data);
    });
  }

  @override
  void initState() {
    
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
          HomeProductPage(list)

        ],
      ),
    );
  }
}
