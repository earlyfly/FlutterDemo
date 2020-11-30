import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,// 修改状态栏颜色
        title: Text('我的', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child: Center(
          child: Text('我的'),
        ),
      ),
    );
  }
}