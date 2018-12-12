import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'api/apis.dart';
import './model/topicModal.dart';

class Topic extends StatefulWidget {
  _Topic createState() => new _Topic();
}

class _Topic extends State<Topic> {
  num page = 1;
  num limit = 5;
  String tab = '';
  bool isFetching = false;
  List<Data> data = [];

  @override
  void initState() {
    super.initState();
    _getTopics();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getTopics() async {
    Dio dio = new Dio();
    Response response = await dio.get(getTopciList + '?limit=20&page=$page');
    final topics = TopicModel.fromJson(response.data);
    setState(() {
      data = topics.data;
    });
    print('loaded');
  }

  Widget listViewItem(Data data) {
    return new ListTile(
        leading: new Container(
          child: new Image.network(data.author.avatarUrl, fit: BoxFit.cover),
          width: 50,
          height: 50,
        ),
        trailing: new Icon(Icons.keyboard_arrow_right),
        title: new Text(
          data.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        subtitle: new Container(
          child: new Text('作者: ${data.author.loginName}'),
          padding: EdgeInsets.only(top: 4),
        ));
  }

  @override
  Widget build(BuildContext context) => new MaterialApp(
      title: 'topic page',
      home: Scaffold(
          appBar: AppBar(
            title: new Text('CNode'),
          ),
          body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) =>
                listViewItem(data[index]),
          )));
}
