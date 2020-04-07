import 'package:flutter/material.dart';
import 'package:flutter_first/pages/product_detail_page.dart';
import '../model/product.dart';

class HomeProductPage extends StatelessWidget {
  final List<ProductItemModal> list;
  HomeProductPage(this.list);

  Widget _build(BuildContext context, double deviceWidth) {
    //item 宽度 大概是屏幕的一半少一点
    double itemWidth = deviceWidth * 175.5 / 360.0;
    double imageWidth = deviceWidth * 160.0 / 360.0;
    double imageHeight = deviceWidth * 85.0 / 360.0;

    List<Widget> listWidgets = list.map((e) {
      return GestureDetector(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductDetailPage(
                  item: e,
                );
              },
            ),
          );
        },
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(bottom: 3, left: 2), //外边距
          padding: EdgeInsets.only(top: 5, left: 6, bottom: 1),
          color: Colors.white70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 1),
                child: Image.asset(
                  e.imageUrl,
                  height: imageHeight,
                  width: imageWidth,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  e.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.black26),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  e.type,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.only(left: 5, bottom: 5),
          child: Text(
            "名品猫咪",
            style: TextStyle(fontSize: 13.0, color: Colors.black),
          ),
        ),
        Wrap(
          spacing: 2,
          children: listWidgets,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return _build(context, deviceWidth);
  }
}
