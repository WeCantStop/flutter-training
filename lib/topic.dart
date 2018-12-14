import 'package:flutter/material.dart';
import './topicTab.dart';

class Topic extends StatefulWidget {
  _Topic createState() => new _Topic();
}

class _Topic extends State<Topic> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> tabBarItems = ['全部', '精华', '分享', '问答', '招聘'];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _topTabBar() {
    return new TabBar(
      tabs: <Widget>[
        new Tab(
          text: '全部',
        ),
        new Tab(
          text: '精华',
        ),
        new Tab(
          text: '分享',
        ),
        new Tab(
          text: '问答',
        ),
        new Tab(
          text: '招聘',
        ),
      ],
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'topic page',
        home: Scaffold(
            appBar: AppBar(
              title: new Text('Topic'),
              bottom: _topTabBar(),
            ),
            body: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                new TopicTab(tab: ''),
                new TopicTab(tab: 'good'),
                new TopicTab(tab: 'share'),
                new TopicTab(tab: 'ask'),
                new TopicTab(tab: 'job'),
              ],
            )));
  }
}
