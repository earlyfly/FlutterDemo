import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_20211027/components/DashLine.dart';
import 'package:flutter_test_20211027/components/StarRatingView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark, // 修改状态栏颜色
        title: Text('首页', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
//        width: 300,
//        height: 600,
        child: CustomView(),
      ),
    );
  }
}

class CustomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        /// 获取父组件的宽度和高度
        print('获取父组件宽度${constraints.constrainWidth()}');
        print('获取父组件高度${constraints.constrainHeight()}');
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),

              /// 富文本拼接
              child: Text.rich(TextSpan(
                children: [
                  TextSpan(
                      text: '肖生克救赎',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: '(1994)-大莱卡棉开幕式看大妈们速度莱卡棉德拉克马莱卡棉的萨摩的卡没电啦',
                      style: TextStyle(fontSize: 14)),
                ],
              )),
            ),

            /// 分割线
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: DashLine(
                Axis.horizontal,
                lineMainAxisWidth: 15,
                lineCrossAxisHeight: 5,
                color: Colors.white,
              ),
            ),

            /// 星级评分
            StarRatingView(
              totalStar: 5,
              starRating: 4.3,
              starSize: 20,
            ),

            FlatButton(
              onPressed: () async {
                var futureValue = await runiOSMethod();
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        futureValue,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                );
              },
              child: Text(
                '我是按钮',
                style: TextStyle(fontSize: 12.0),
              ),
              color: Colors.red,
              textColor: Colors.white,
            )
          ],
        );
      },
    );
  }

  //调用原生方法
  Future runiOSMethod() async {
    const platform = const MethodChannel('lianchu');
    var result;
    try {
      result = await platform.invokeMethod('comeonman');
      return Future.value(result);
    } on PlatformException catch (e) {
      return Future.error(e.toString());
    }
  }
}
