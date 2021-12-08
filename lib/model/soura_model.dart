class SouraModel {
  List<SouraContant> soura = [];
  SouraModel.fromjson(Map<String, dynamic> json) {
    json['soura'].forEach((e) {
      soura.add(SouraContant.fromjson(e));
    });
  }
}

class SouraContant {
  String? place;
  String? type;
  int? count;
  String? title;
  String? index;
  String? titleAr;
  String? pages;
  List<SouraPage>? verse;
  SouraContant.fromjson(Map<String, dynamic> json) {
    place = json['place'];
    type = json['type'];
    count = json['count'];
    title = json['title'];
    index = json['index'];
    titleAr = json['titleAr'];
    pages = json['pages'];
    verse =
        List<SouraPage>.from(json["verse"].map((x) => SouraPage.fromjson(x)));
  }
}

class SouraPage {
  List<String>? page;
  SouraPage.fromjson(Map<String, dynamic> json) {
    page = List<String>.from(json["page"].map((x) => x));
  }
}
