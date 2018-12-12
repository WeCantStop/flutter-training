import 'package:flutter/material.dart';
import './demo.dart';
import './listPage.dart';

void main() => runApp(MyApp());

// 声明 Home Widget
class BodyContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Container(
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Demo()),
                      );
                    },
                    color: Colors.green,
                    child: Text(
                      'go fetch demo page',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListPage()),
                    );
                  },
                  child: new Text('go ListPage', textAlign: TextAlign.center),
                  color: Colors.blue,
                )),
                new Expanded(
                  child: new Container(
                    child: new Text('左二', textAlign: TextAlign.center),
                    color: Colors.yellow,
                    margin: EdgeInsets.only(left: 20),
                  ),
                )
              ],
            ),
            new Container(
              child: new Text(
                '三奥术大师大大大所大撒大多三奥术大师大大大所大撒大多三奥术大师大大大所大撒大多三奥术大师大大大所大撒大多三奥术大师大大大所大撒大多三奥术大师大大大所大撒大多',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(const Radius.circular(8.0))),
            ),
            new Image.network(
                'https://tac-cdn.zhongan.com/wxapp/activity/double_99/top_bg.png'),
          ],
        ),
        padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
        color: Colors.black12,
      );
}

// 声明 首页 Widget
class MyApp extends StatelessWidget {
  //重写build方法
  @override
  Widget build(BuildContext context) {
    //返回一个Material风格的组件
    return MaterialApp(
        title: 'Home',
        home: Scaffold(
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
