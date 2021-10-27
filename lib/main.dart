import 'package:flutter/material.dart';
import 'home/HomePage.dart';
import 'more/MorePage.dart';
import 'mine/MinePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,// 去掉debug浮窗
      //Theme.of(context).accentColor,//获取主题色
      theme: ThemeData(
        primaryColor: Colors.cyan,
        //highlightColor: Colors.transparent,// 去掉点击高亮效果
        //splashColor: Colors.transparent,// 去掉水波纹效果
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _pageIndex = 0;
  List _bottomBars = [
    {'icon': 'ic_tab_home', 'title':'首页'},
    {'icon': 'ic_tab_video', 'title':'更多'},
    {'icon': 'ic_tab_info', 'title':'我的'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: IndexedStack(
        index: _pageIndex,
        children: <Widget>[
          HomePage(),
          MorePage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        iconSize: 20,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        items: _bottomBars.map((value){
          return BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/${value['icon']}.png')),
            activeIcon: ImageIcon(AssetImage('assets/images/${value['icon']}_press.png')),
            title: Text('${value['title']}'),
          );
        }).toList(),
        onTap: (index){
          setState(() {
            this._pageIndex = index;
          });
        },
      ),
    );
  }
}
