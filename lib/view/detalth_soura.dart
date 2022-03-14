import 'package:flutter/material.dart';
import 'package:t_shert/model/soura_model.dart';

class DetetheSoura extends StatelessWidget {
  List<SouraPage>? soura;

  int creindex = 1;
  DetetheSoura({
    Key? key,
    required this.soura,
  }) : super(key: key);

  String getVerseEndSymbol(int verseNumber) {
    String arabicNumeric = " ";

    for (int i = verseNumber.toString().length - 1; i >= 0; i--) {
      String digit = verseNumber.toString().split("")[i];
      if (digit == "0") {
        arabicNumeric += "٠";
      } else if (digit == "1") {
        arabicNumeric += "۱";
      } else if (digit == "2") {
        arabicNumeric += "۲";
      } else if (digit == "3") {
        arabicNumeric += "۳";
      } else if (digit == "4") {
        arabicNumeric += "٤";
      } else if (digit == "5") {
        arabicNumeric += "٥";
      } else if (digit == "6") {
        arabicNumeric += "٦";
      } else if (digit == "7") {
        arabicNumeric += "۷";
      } else if (digit == "8") {
        arabicNumeric += "۸";
      } else if (digit == "9") {
        arabicNumeric += "۹";
      }
    }

    arabicNumeric += "\u06dd";

    return arabicNumeric;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: 604,
          itemBuilder: (context, index) {
            return Container(
                // width: double.infinity,
                // height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(0.0),
                child: Image.asset("assets/quran-images/${index + 1}.png"));
          },
        ),
      ),
    );
  }

//   List<String> charSeparator(List<String>? soura) {
//     List<String> list = [];
//     [
//       ...soura!.map((a) => a.split(" ").map((ch) => ch.split(" "))).map((s) => [
//             ...s.map(
//               (c) => c.toString().replaceAll("[", " ").replaceAll(']', ""),
//               // textAlign: TextAlign.,
//             )
//           ])
//     ].forEach((element) {
//       element.forEach((e) {
//         list.add(e);
//       });
//     });
//     return list;
//   }
}
// ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (_, index) {
//               return Text(verse[index]);
//             },
//             itemCount: verse.length,
//           )



// Wrap(
//                 children: [
//                   ...charSeparator(soura![index].page!)!
//                   // .map((e) => e.split(" "))
//                   // .toList()
//                   // .map((s) => s.map((e) => e.split(" ")))
//                   // .toList()
//                   // .map((e) => Text(
//                   //       e.toString() + "* ",
//                   //       overflow: TextOverflow.visible,
//                   //       style: const TextStyle(
//                   //           fontFamily: "Arabic7", fontSize: 24),
//                   //     ))
//                 ],
//               ),


//  RichText(
//                 textAlign: TextAlign.justify,
//                 text: TextSpan(
//                   children: charSeparator(soura![index].page!)
//                       .map((e) => TextSpan(
//                             text: e + "    ",
//                           ))
//                       .toList(),
//                   style: const TextStyle(
//                       color: Colors.black, fontSize: 20, fontFamily: "Arabic4"),
//                 ),
//               ),