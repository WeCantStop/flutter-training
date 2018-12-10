import 'package:flutter/material.dart';

//主函数（入口函数），下面我会简单说说Dart的函数
void main() => runApp(MyApp());

// 生命Home widget
class BodyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print('点击按钮一了');
            },
            color: Colors.green,
            child: Text('按钮一', style: TextStyle(color: Colors.pink),),
          ),
          new Text('二'),
          new Text('三'),
          new Text('四')
        ],
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 0, 0));
}

// 声明MyApp类
class MyApp extends StatelessWidget {
  //重写build方法
  @override
  Widget build(BuildContext context) {
    //返回一个Material风格的组件
    return MaterialApp(
        title: 'Welcome to Flutteraa',
        home: Scaffold(
            //创建一个Bar，并添加文本
            appBar: AppBar(
              title: Text(
                '首页',
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
              backgroundColor: Colors.green,
            ),
            body: new BodyContainer(),
            floatingActionButton: new GestureDetector(
              onTap: () {
                print('test');
              },
              child: new FloatingActionButton(
                tooltip: 'Add',
                child: new Icon(Icons.add),
                onPressed: null,
              ),
            )));
  }
}
