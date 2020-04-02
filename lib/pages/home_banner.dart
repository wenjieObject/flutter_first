import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {
  List<String> bannerItes = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    //设备宽度
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;

    return Container(
        width: width,
        height: height,
        child: Swiper(
          itemCount: bannerItes.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: EdgeInsets.only(left: 1, right: 1),
              child: Image.asset(
                bannerItes[index],
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            );
          },
          autoplay: true,
          scrollDirection: Axis.horizontal,
        ));
  }
}
