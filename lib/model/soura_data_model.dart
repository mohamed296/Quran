// class SouraDataModel {
//   List<SouraDetailth> souraContant = [];
//   SouraDataModel.fromjson(Map<String, dynamic> json) {
//     json['soura_contant'].forEach((element) {
//       souraContant.add(SouraDetailth.fromjson(element));
//     });
//   }
// }

// class SouraDetailth {
//   String? index;
//   String? name;
//   List<String>? verse;
//   int? count;
//   SouraDetailth.fromjson(Map<String, dynamic> json) {
//     index = json['index'];
//     name = json['name'];
//     verse = List<String>.from(json["verse"].map((x) => x));
//     count = json['count'];
//   }
// }
