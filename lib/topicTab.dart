import 'package:flutter/material.dart';
import './model/topicModel.dart';
import 'package:dio/dio.dart';
import 'api/apis.dart';

class TopicTab extends StatefulWidget {
  TopicTab({Key key, this.tab, this.callback}) : super(key: key);

  final String tab;
  final callback;

  @override
  _TopicTab createState() => new _TopicTab();
}

class _TopicTab extends State<TopicTab> with AutomaticKeepAliveClientMixin {
  num page = 1;
  num limit = 5;
  num bottomloadingLimit = 100;
  bool isFetching = false;
  List<Data> data = [];
  ScrollController _scrollController = new ScrollController();

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getTopics();
    _scrollListener();
  }

  _getTopics() async {
    if (!isFetching) {
      setState(() => isFetching = true);
      Dio dio = new Dio();
      final fetchUrl = getTopciList + '?limit=20&tab=${widget.tab}&page=$page';
      Response response = await dio.get(fetchUrl);
      final topics = TopicModel.fromJson(response.data);

      setState(() {
        data.addAll(topics.data);
        isFetching = false;
      });
    }
  }

  _goTopicDetail(String id) {
    widget.callback(id);
  }

  _scrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + bottomloadingLimit >
          _scrollController.position.maxScrollExtent) {
        setState(() {
          page++;
        });
        _getTopics();
      }
    });
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

  Widget listViewItem(Data data) {
    return new ListTile(
        onTap: () => _goTopicDetail(data.id),
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
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == data.length) {
          return _buildFetchingIndicator();
        } else {
          return listViewItem(data[index]);
        }
      },
      controller: _scrollController,
    );
  }
}
