class Model {
  List<dynamic> azkar = [];
  Model.fromjson(Map<String, dynamic> json) {
    json['azkar'].forEach((e) => azkar.add(AzkarModel.fromjson(e)));
  }
}

class AzkarModel {
  String? title;
  String? count;
  String? bookmark;
  List<Content> content = [];
  AzkarModel.fromjson(Map<String, dynamic> json) {
    title = json['title'];
    count = json['count'];
    bookmark = json['bookmark'];
    json['content'].forEach((e) => content.add(Content.fromjson(e)));
  }
}

class Content {
  String? text;
  String? count;
  String? fadl;
  String? source;
  Content.fromjson(Map<String, dynamic> json) {
    text = json['text'];
    count = json['count'];
    fadl = json['fadl'];
    source = json['source'];
  }
}
