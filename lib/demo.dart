import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'dart:async';
import 'dart:convert';

import './model/topic.dart';

class TopicDetailState extends StatefulWidget {
  @override
  _TopicWidget createState() => new _TopicWidget();
}

class _TopicWidget extends State<TopicDetailState> {
  String authorId = '';

  Future<TopicModel> _fetchData() async {
    Dio dio = new Dio();
    Response response;
    response = await dio
        .get('https://cnodejs.org/api/v1/topic/5433d5e4e737cbe96dcef312');

    final topic =  TopicModel.fromJson(json.decode(response.data));
    
    print(topic);

    // print(response.data);
    // return res;

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) => Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: _fetchData,
              child: new Text('fetch'),
            ),
            new Text('$authorId')
          ],
        ),
      );
}

class Demo extends StatelessWidget {
  void _fetchData() async {
    Dio dio = new Dio();
    Response response;
    response = await dio
        .get('https://cnodejs.org/api/v1/topic/5433d5e4e737cbe96dcef312');
    print(response.data);
  }

  @override
  Widget build(BuildContext context) => new MaterialApp(
        title: 'demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Demo',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
            backgroundColor: Colors.green,
          ),
          body: new Container(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Text(
                    'Demo Page',
                    style: TextStyle(fontSize: 24),
                  ),
                  new RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text('go back'),
                    color: Colors.green,
                  ),
                  new RaisedButton(
                    onPressed: _fetchData,
                    child: Text(
                      'fetch data',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                  ),
                  new TopicDetailState()
                ],
              ),
            ),
          ),
        ),
      );
}
