import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('company_info');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/loading.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              'this.is.Flutter',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  decoration: TextDecoration.none),
            ),
          )
        ],
      ),
    );
  }
}
