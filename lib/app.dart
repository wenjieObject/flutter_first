import 'package:flutter/material.dart';
import 'pages/about_us_page.dart';
import 'pages/home_page.dart';
import 'pages/news_page.dart';
import 'pages/product_page.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedIndex = 0;

  AboutUsPage aboutUsPage;
  HomePage homePage;
  NewsPage newsPage;
  ProductPage productPage;

   _getCurrentPage() {
    switch (_selectedIndex) {
      case 3:
        if (aboutUsPage == null) {
          aboutUsPage = AboutUsPage();
        }
        return aboutUsPage;
        break;
      case 0:
        if (homePage == null) {
          homePage = HomePage();
        }
        return homePage;
        break;
      case 2:
        if (newsPage == null) {
          newsPage = NewsPage();
        }
        return newsPage;
        break;
      case 1:
        if (productPage == null) {
          productPage = ProductPage();
        }
        return productPage;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("this.is.flutter"),
        leading: Icon(Icons.home),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('Product')),
          BottomNavigationBarItem(icon: Icon(Icons.new_releases), title: Text('News')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('AboutUs')),
        ],
        currentIndex: _selectedIndex,
        //设置颜色
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
