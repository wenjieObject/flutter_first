import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login/login.dart';
import 'login/register.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/register',
      home: RegisterForm(),
      routes: {
        '/register':(context)=>RegisterForm(),
        '/login':(context)=>LoginForm()
      },
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70
      ),
    );
  }
}
 

//
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: Container(child: Text('123'))),
            ImageWidget(),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              //style: Theme.of(context).textTheme.headline4,
            ),
            //RandomWordsWidget(),
            Echo(text: "hello world"),
            IconWidget(),
            SwitchAndCheckBoxTestRoute(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// 开关
class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Switch(
        value: _switchSelected, //当前状态
        onChanged: (value) {
          //重新构建页面
          setState(() {
            _switchSelected = value;
          });
        },
      ),
      Text('data'),
      Checkbox(
        value: _checkboxSelected,
        activeColor: Colors.red, //选中时的颜色
        onChanged: (value) {
          //print(value);
          setState(() {
            _checkboxSelected = value;
          });
        },
      ),
      Text('data1'),
    ]);
  }
}

//ICON
class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.subway,
          color: Colors.green,
        ),
        Icon(
          Icons.error,
          color: Colors.green,
        ),
        Icon(
          Icons.fingerprint,
          color: Colors.green,
        ),
      ],
    );
  }
}

//生成随机字符串
// class RandomWordsWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = new WordPair.random();
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: new Text(wordPair.toString()),
//     );
//   }
// }

//加载图片
class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/a_dot_ham.jpg',
      width: 100,
    );
  }
}

//echo
class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}
