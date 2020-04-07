import 'package:flutter/material.dart';
import 'package:flutter_first/model/product.dart';


class ProductDetailPage extends StatelessWidget {

  final ProductItemModal item;
  ProductDetailPage({Key key,@required this.item}):super(key:key);

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width ;
    double imageWidth = MediaQuery.of(context).size.width * 11.8 / 12;
    double imageHeight = MediaQuery.of(context).size.width * 6 / 12;

    return Container(
      width: deviceWidth,
      padding: EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 3),
                child: Image.asset(
                  item.imageUrl,
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.cover,
                ),
          ),
           Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.white54),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  item.type,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.white54),
                ),
              ),
               Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  item.desc,
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.white54),
                ),
              ),
        ],
      ),
    );
  }
}