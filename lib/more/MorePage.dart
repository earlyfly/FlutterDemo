import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final _tabs = ["电视", "电影", "CCTV"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerScrolled) => <Widget>[
            SliverOverlapAbsorber(
              // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                pinned: true,
                brightness: Brightness.dark,
                title: Text('NestedScroll Demo', style: TextStyle(color: Colors.white),),
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                      "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2460849880,3483239222&fm=26&gp=0.jpg",
                      fit: BoxFit.cover),
                ),
                bottom: TabBar(
                    tabs: _tabs
                        .map((tab) =>
                            Text(tab, style: TextStyle(fontSize: 18.0, color: Colors.white)))
                        .toList()),
                forceElevated: innerScrolled,
              ),
            )
          ],
          body: TabBarView(
              children: _tabs
                  // 这边需要通过 Builder 来创建 TabBarView 的内容，否则会报错
                  // NestedScrollView.sliverOverlapAbsorberHandleFor must be called with a context that contains a NestedScrollView.
                  .map(
                    (tab) => Builder(
                      builder: (context) => CustomScrollView(
                        // key 保证唯一性
                        key: PageStorageKey<String>(tab),
                        slivers: <Widget>[
                          // 将子部件同 `SliverAppBar` 重叠部分顶出来，否则会被遮挡
                          SliverOverlapInjector(
                              handle: NestedScrollView
                                  .sliverOverlapAbsorberHandleFor(context)),
                          SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                  (_, index) => Image.network(
                                      "https://oimagea6.ydstatic.com/image?id=6765010721196479494&product=adpublish&w=520&h=347",
                                      fit: BoxFit.cover),
                                  childCount: 8),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0)),
                          SliverFixedExtentList(
                              delegate: SliverChildBuilderDelegate(
                                  (_, index) => Container(
                                      child: Text(
                                        '$tab - item${index + 1}',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      alignment: Alignment.center),
                                  childCount: 15),
                              itemExtent: 50.0)
                        ],
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
