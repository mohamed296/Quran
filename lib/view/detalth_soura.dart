import 'package:flutter/material.dart';
import 'package:t_shert/model/soura_model.dart';

class DetetheSoura extends StatelessWidget {
  final List<SouraPage>? soura;

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
          itemCount: soura!.length,
          itemBuilder: (context, index) {
            return Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: soura![index]
                      .page!
                      .map((e) => TextSpan(
                            text: e + getVerseEndSymbol(creindex++),
                          ))
                      .toList(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
// ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (_, index) {
//               return Text(verse[index]);
//             },
//             itemCount: verse.length,
//           )