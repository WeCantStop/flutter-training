import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPage createState() => new _ListPage();
}

class _ListPage extends State<ListPage> {
  // 数据, List类型
  List<int> testItem = List.generate(20, (i) => i);
  // 监听滚动
  ScrollController _scrollController = new ScrollController();
  bool isFetch = false;
  num offHeight = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + offHeight >
          _scrollController.position.maxScrollExtent) {
        _getData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<int> _genNewList(from, to) {
    return List.generate(to - from, (i) => i + from);
  }

  _getData() {
    setState(() {
      testItem.addAll(_genNewList(testItem.length, testItem.length + 10));
    });
  }

  Widget listViewItem(String title) {
    return new ListTile(
        leading: new Icon(Icons.home),
        trailing: new Icon(Icons.map),
        title: new Text(title),
        subtitle: new Text("我是subtitle"));
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'list page',
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'List',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
            backgroundColor: Colors.green,
          ),
          body: new ListView.builder(
            itemCount: testItem.length,
            itemBuilder: (context, index) => listViewItem(index.toString()),
            controller: _scrollController,
          ),
        ),
      );
}
