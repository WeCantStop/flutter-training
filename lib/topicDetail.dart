import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'api/apis.dart';
import './model//topicDetailModel.dart';
import 'package:flutter_html_textview/flutter_html_textview.dart';

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
    final res = TopicDetailModel.fromJson(response.data);
    // setState(() {
    //   topicDetail = res;
    // });
    print(res);
    return res;
  }

  Widget build(BuildContext context) => new MaterialApp(
      title: 'Topic Detail',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('话题详情页'),
        ),
        body: new Center(
            child: FutureBuilder<TopicDetailModel>(
          future: topicDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return Text(snapshot.data.data.content);
              return new HtmlTextView(data: snapshot.data.data.content);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        )),
      ));
}
