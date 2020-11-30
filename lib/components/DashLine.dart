import 'package:flutter/material.dart';

/// 分割线
class DashLine extends StatelessWidget {
  @required final Axis axis; // 分割线方向
  final double lineMainAxisWidth; // 分割线主轴方向长度
  final double lineCrossAxisHeight; // 分割线垂直轴方向高度
  final Color color; // 分割线颜色

  DashLine(this.axis, {this.lineMainAxisWidth = 2, this.lineCrossAxisHeight = 2, this.color = const Color(0xffeeeeee)});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
          direction: this.axis,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: setupLine(constraints),
        );
      },
    );
  }

  List<Widget> setupLine(BoxConstraints constraints){
    // 根据主轴方向获取父组件的宽度或高度
    final parentMainAxisW = this.axis == Axis.horizontal ? constraints.constrainWidth() : constraints.constrainHeight();
    // 计算分割线个数
    int count = parentMainAxisW ~/ lineMainAxisWidth ~/ 2;// 整除
    // 创建分割线组
    List<Widget> tempArr = [];
    for(int i = 0; i < count; ++i){
      tempArr.add(Container(
        width: this.axis == Axis.horizontal ? this.lineMainAxisWidth : this.lineCrossAxisHeight,
        height: this.axis == Axis.horizontal ? this.lineCrossAxisHeight : this.lineMainAxisWidth,
        color: this.color,
      ));
    }
    return tempArr;
  }
}
