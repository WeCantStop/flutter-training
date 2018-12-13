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
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _getTopics();
    _scrollListener();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _scrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          page++;
        });
        _getTopics();
      }
    });
  }

  _getTopics() async {
    if (!isFetching) {
      setState(() => isFetching = true);
      Dio dio = new Dio();
      Response response = await dio.get(getTopciList + '?limit=20&page=$page');
      final topics = TopicModel.fromJson(response.data);

      setState(() {
        data.addAll(topics.data);
        isFetching = false;
      });
    }
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

  Widget _buildFetchingIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isFetching ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => new MaterialApp(
      title: 'topic page',
      home: Scaffold(
          appBar: AppBar(
            title: new Text('Topic'),
          ),
          body: ListView.builder(
            itemCount: data.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == data.length) {
                return _buildFetchingIndicator();
              } else {
                return listViewItem(data[index]);
              }
            },
            controller: _scrollController,
          )));
}
