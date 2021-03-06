class TopicModel {
  final DataModel data;
  final bool success;

  TopicModel({this.success, this.data});

  factory TopicModel.fromJson(Map<String, dynamic> json) => new TopicModel(
      data: DataModel.fromJson(json['data']), success: json['success']);
}

class DataModel {
  final String id;
  final String authorId;
  final String tab;
  final String content;

  DataModel({this.id, this.authorId, this.content, this.tab});

  factory DataModel.fromJson(Map<String, dynamic> json) => new DataModel(
      id: json['id'],
      authorId: json['author_id'],
      tab: json['tab'],
      content: json['content']);
}
