class TopicDetailModel {
  final bool success;
  final Data data;

  TopicDetailModel({this.success, this.data});

  factory TopicDetailModel.fromJson(Map<String, dynamic> json) {
    return TopicDetailModel(
        data: Data.fromJson(json['data']), success: json['success']);
  }
}

class Data {
  final String content;
  final String title;
  final Author author;

  Data({this.content, this.title, this.author});

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
        content: json['content'],
        title: json['title'],
        author: Author.fromJson(json['author']),
      );
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
