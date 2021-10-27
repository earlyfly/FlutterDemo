import 'package:flutter/material.dart';

class StarRatingView extends StatefulWidget {
  final int totalStar; // 总共星数, 默认值5
  final double starRating; // 星级评分
  final double starSize;
  final Color unSelectColor;
  final Color selectColor;

  StarRatingView({
    this.totalStar = 5,
    this.starRating = 0,
    this.starSize = 20,
    Color? unSelectColor,
    Color? selectColor,
  })  : unSelectColor = unSelectColor ?? Colors.grey,
        selectColor = selectColor ?? Colors.orange;

  @override
  _StarRatingViewState createState() => _StarRatingViewState();
}

class _StarRatingViewState extends State<StarRatingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _getStarUnSelectView(),
          _getStarSelectView(widget.starRating),
        ],
      ),
    );
  }

  /// 设置未选中状态的星级
  Widget _getStarUnSelectView() {
    return Row(
      mainAxisSize: MainAxisSize.min, // 设置row内容包裹，不占据一行
      children: List.generate(widget.totalStar, (index) {
        return Icon(Icons.star, color: widget.unSelectColor, size: widget.starSize);
      }),
    );
  }

  /// 设置选中状态的星级
  Widget _getStarSelectView(double starValue) {

    // 超过最大星级按最大星级处理
    starValue = starValue > widget.totalStar ? widget.totalStar.toDouble() : starValue;
    // 星级是否为整星
    bool isInt = starValue % 1 == 0;
    // 整星数
    int fullCount = starValue ~/ 1;
    // 非整星数所占比例
    double notFullCount = starValue - fullCount;

    // 完整的星
    List<Widget> starWidgets = [];
    for (int i = 0; i < fullCount; ++i) {
      starWidgets.add(Icon(Icons.star, color: widget.selectColor, size: widget.starSize));
    }

    if(!isInt) {
      // 不完整的星
      starWidgets.add(ClipRect(
        clipper: StarRectClipper(clipScale: notFullCount),
        child: Icon(Icons.star, color: widget.selectColor, size: widget.starSize),
      ));
    }

    return Row(
      mainAxisSize: MainAxisSize.min, // 设置row内容包裹，不占据一行
      children: starWidgets,
    );
  }
}

/// ClipRect切割组件所需要的clipper参数，需自定义
class StarRectClipper extends CustomClipper<Rect> {
  final double clipScale;

  StarRectClipper({required this.clipScale});

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, size.width * this.clipScale, size.height);
  }

  @override
  bool shouldReclip(StarRectClipper oldClipper) {
    // TODO: implement shouldReclip
    return clipScale != oldClipper.clipScale;
  }
}
