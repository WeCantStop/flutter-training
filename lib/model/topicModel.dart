class TopicModel {
  final List<Data> data;
  final bool success;

  TopicModel({this.success, this.data});

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();

    return TopicModel(data: dataList, success: json['success']);
  }
}

class Author {
  final String loginName;
  final String avatarUrl;

  Author({this.loginName, this.avatarUrl});

  factory Author.fromJson(Map<String, dynamic> json) => new Author(
        loginName: json['loginname'],
        avatarUrl: json['avatar_url'],
      );
}

class Data {
  final String id;
  final String title;
  final Author author;
  final num replyCount;
  final num visitCount;

  Data({this.title, this.author, this.replyCount, this.visitCount, this.id});

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
      title: json['title'],
      author: Author.fromJson(json['author']),
      replyCount: json['reply_count'],
      visitCount: json['visit_count'],
      id: json['id']);
}
