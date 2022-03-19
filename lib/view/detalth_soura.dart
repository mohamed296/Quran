import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_shert/provider/cubit.dart';
import 'package:t_shert/provider/state.dart';

class DetetheSoura extends StatefulWidget {
  final int? index;
  const DetetheSoura({
    this.index = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<DetetheSoura> createState() => _DetetheSouraState();
}

class _DetetheSouraState extends State<DetetheSoura> {
  late int creindex;

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

    // arabicNumeric += "\u06dd";

    return arabicNumeric.split("").reversed.join();
  }

  late PageController pageController;

  // void onAddButtonTapped(int index) {
  //   // use this to animate to the page
  //   pageController.animateToPage(index,
  //       duration: const Duration(milliseconds: 1000),
  //       curve: Curves.linearToEaseOut);
  //   // or this to jump to it without animating
  //   pageController.jumpToPage(index);
  // }
  @override
  void initState() {
    creindex = widget.index!;
    pageController = PageController(
      initialPage: creindex,
      keepPage: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AppCubit()..getAzkar(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context).page;
            return state is GetAzkerLoding
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PageView.builder(
                        // onPageChanged: (pageNum) {
                        //   creindex = pageNum;
                        //   onAddButtonTapped(pageNum);
                        // },
                        controller: pageController,
                        itemCount: cubit!.page.length + 1,
                        itemBuilder: (context, index) {
                          // creindex = creindex == 0 ? index : creindex;
                          // index = creindex;
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    cubit.page[index].name.toString(),
                                    style:
                                        const TextStyle(fontFamily: "Arabic6"),
                                  ),
                                  Text(
                                    cubit.page[index].jza.toString(),
                                    style:
                                        const TextStyle(fontFamily: "Arabic6"),
                                  )
                                ],
                              ),
                              Container(
                                  // width: double.infinity,
                                  // height: MediaQuery.of(context).size.height,
                                  padding: const EdgeInsets.all(0.0),
                                  child: Image.asset(
                                      "assets/quran-images/${index + 1}.png")),
                              Center(
                                child: Text(
                                    getVerseEndSymbol(index + 1).toString(),
                                    style: const TextStyle(
                                        fontFamily: "Arabic6", fontSize: 18)),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                    "الحزب " +
                                        getVerseEndSymbol(int.parse(
                                            cubit.page[index].haz.toString())),
                                    style: const TextStyle(
                                        fontFamily: "Arabic6", fontSize: 16)),
                              )
                            ],
                          );
                        },
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