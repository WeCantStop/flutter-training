import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html_textview/flutter_html_textview.dart';

import 'api/apis.dart';
import './model//topicDetailModel.dart';

class TopicDetail extends StatefulWidget {
  final String id;
  TopicDetail({this.id});

  @override
  State<StatefulWidget> createState() {
    return new _TopicDetail();
  }
}

class _TopicDetail extends State<TopicDetail> {
  Future<TopicDetailModel> topicDetail;

  @override
  void initState() {
    super.initState();
    topicDetail = _getTopicDetial();
  }

  Future<TopicDetailModel> _getTopicDetial() async {
    Dio dio = new Dio();
    Response response = await dio.get(getTopicDetail + '/${widget.id}');
    return TopicDetailModel.fromJson(response.data);
  }

  Widget build(BuildContext context) => new MaterialApp(
      title: 'Topic Detail',
      home: Scaffold(
          appBar: AppBar(
            title: new Text('话题详情页'),
          ),
          body: ListView(
            shrinkWrap: false,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              FutureBuilder<TopicDetailModel>(
                future: topicDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new HtmlTextView(data: snapshot.data.data.content);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return new Stack(
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
                        child: new Center(
                          child: new CircularProgressIndicator(),
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                        child: new Center(
                          child: new Text('正在玩命加载中~'),
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          )));
}
