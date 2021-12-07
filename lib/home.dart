// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:screenshot/screenshot.dart';

// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   double h = 200;
//   double h2 = 200;
//   Offset offsetImage = const Offset(100, 0);
//   Offset offsetText = const Offset(200, 0);
//   Offset offsetImage2 = const Offset(100, 0);
//   Offset offsetText2 = const Offset(100, 0);
//   double textSize = 14.0;
//   double textSize2 = 14.0;
//   int index = 0;

//   var textControler = TextEditingController();

//   var picker = ImagePicker();
//   XFile? imageProfile;
//   String imagePath = "";
//   String imagePath2 = "";
//   Uint8List? scren;
//   String savedImage = "";

//   Future getImage() async {
//     imageProfile =
//         await picker.pickImage(source: ImageSource.gallery).then((value) async {
//       setState(() {
//         imagePath != "" ? imagePath2 = value!.path : imagePath = value!.path;
//       });
//     });
//   }

//   Future saveImage(Uint8List scren) async {
//     final appStorage = await getApplicationDocumentsDirectory();
//     savedImage = appStorage.path;
//   }

//   void dailog(String title, Widget content, List<Widget> listWidget) {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (_) {
//           return AlertDialog(
//             title: Text(title),
//             content: content,
//             actions: listWidget,
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("T-shert"),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               image(),
//               const SizedBox(
//                 height: 10,
//               ),
//               if (index == 0)
//                 Slider(
//                   value: h,
//                   onChanged: (value) {
//                     setState(() {
//                       h = value;
//                     });
//                   },
//                   max: 1000.0,
//                   min: 50.0,
//                 ),
//               if (index == 1)
//                 Slider(
//                   value: textSize,
//                   onChanged: (value) {
//                     setState(() {
//                       textSize = value;
//                     });
//                   },
//                   max: 50.0,
//                   min: 5.0,
//                 ),
//               if (index == 2)
//                 Slider(
//                   value: h2,
//                   onChanged: (value) {
//                     setState(() {
//                       h2 = value;
//                     });
//                   },
//                   max: 1000.0,
//                   min: 50.0,
//                 ),

//               const SizedBox(
//                 height: 10,
//               ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   iconButton(imagePath, 0, Image.file(File(imagePath))),
//                   const SizedBox(
//                     width: 20.0,
//                   ),
//                   iconButton(
//                       textControler.text,
//                       1,
//                       const Icon(
//                         Icons.text_fields,
//                         size: 35,
//                       )),
//                   const SizedBox(
//                     width: 20.0,
//                   ),
//                   iconButton(imagePath2, 2, Image.file(File(imagePath2))),
//                   const SizedBox(
//                     width: 20.0,
//                   ),
//                   textControler.text == "" || imagePath2 == ""
//                       ? IconButton(
//                           onPressed: () {
//                             dailog(
//                                 "choose",
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     imagePath2 == ""
//                                         ? IconButton(
//                                             onPressed: () {
//                                               getImage();
//                                               Navigator.pop(context);
//                                             },
//                                             icon: const Icon(Icons.photo))
//                                         : space(),
//                                     textControler.text == ""
//                                         ? IconButton(
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                               dailog(
//                                                 "",
//                                                 TextField(
//                                                     controller: textControler),
//                                                 [
//                                                   TextButton(
//                                                       onPressed: () {
//                                                         textControler.text = "";
//                                                         Navigator.pop(context);
//                                                       },
//                                                       child:
//                                                           const Text("Cansel")),
//                                                   TextButton(
//                                                       onPressed: () {
//                                                         Navigator.pop(context);
//                                                       },
//                                                       child: const Text("OK"))
//                                                 ],
//                                               );
//                                             },
//                                             icon: const Icon(Icons.text_fields))
//                                         : space(),
//                                   ],
//                                 ),
//                                 [
//                                   TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: const Text("Cansel")),
//                                 ]);
//                           },
//                           icon: const Icon(
//                             Icons.add_circle_outline,
//                             size: 50,
//                           ))
//                       : space(),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     imagePath = '';
//                     imagePath2 = '';
//                     textControler.text = "";
//                     textSize = 14.0;
//                     offsetImage = const Offset(100, 0);
//                     offsetImage2 = const Offset(100, 0);
//                     h = 200;
//                     h2 = 200;
//                   });
//                 },
//                 child: const Text("clear image"),
//               ),
//               // ElevatedButton(
//               //   onPressed: () async {
//               //     final controller = ScreenshotController();
//               //     final bytes = await controller.captureFromWidget(image());
//               //     setState(() {
//               //       scren = bytes;
//               //     });
//               //     saveImage(scren!);
//               //   },
//               //   child: const Text("save"),
//               // ),
//               // savedImage != ""
//               //     ? Container(
//               //         height: 500,
//               //         width: 500,
//               //         child: Image.file(File(savedImage)),
//               //       )
//               //     : const SizedBox(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget image() {
//     return Stack(
//       children: [
//         Image.asset("assets/images/t.png"),
//         Center(
//           child: SizedBox(
//             height: 400,
//             width: double.infinity,
//             child: Stack(
//               children: [
//                 imagePath != ''
//                     ? imageStack(imagePath, offsetImage, h)
//                     : space(),
//                 textControler.text != "" ? text(textSize) : space(),
//                 imagePath2 != ''
//                     ? imageStack(imagePath2, offsetImage2, h2)
//                     : space(),
//               ],
//             ),
//           ),
//         ),
//         GestureDetector(
//             onPanUpdate: (details) {
//               if (index == 1) {
//                 setState(() {
//                   offsetText += details.delta;
//                 });
//               } else if (index == 0) {
//                 setState(() {
//                   offsetImage += details.delta;
//                 });
//               } else {
//                 setState(() {
//                   offsetImage2 += details.delta;
//                 });
//               }
//             },
//             child: Image.asset("assets/images/t2.png")),
//       ],
//     );
//   }

//   Widget imageStack(String image, Offset offset, double size) {
//     return Positioned(
//       left: offset.dx,
//       top: offset.dy,
//       child: Opacity(
//         opacity: 0.7,
//         child: SizedBox(
//           height: size,
//           width: size,
//           child: Image.file(File(image)),
//         ),
//       ),
//     );
//   }

//   Widget text(double size) {
//     return Positioned(
//       left: offsetText.dx,
//       top: offsetText.dy,
//       child: Opacity(
//         opacity: 0.6,
//         child: Text(
//           textControler.text,
//           style: TextStyle(fontSize: size),
//         ),
//       ),
//     );
//   }

//   Widget space() {
//     return const SizedBox(
//       height: 0,
//       width: 0,
//     );
//   }

//   Widget sliderImage(double size) {
//     return Slider(
//       value: size,
//       onChanged: (value) {
//         setState(() {
//           size = value;
//         });
//       },
//       max: 1000.0,
//       min: 50.0,
//     );
//   }

//   Widget sliderText(double size) {
//     return Slider(
//       value: size,
//       onChanged: (value) {
//         setState(() {
//           size = value;
//         });
//       },
//       max: 50.0,
//       min: 5.0,
//     );
//   }

//   Widget iconButton(String condetion, int i, Widget widget) {
//     return condetion != ""
//         ? IconButton(
//             onPressed: () {
//               setState(() {
//                 index = i;
//               });
//             },
//             icon: widget)
//         : space();
//   }
// }
