// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// import 'constant.dart';
// class GoTo extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context)
//
//   {
//
//     final argRoute=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
//
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Text("${argRoute["title"]}"),
//       ),
//
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.network(basicUrlImage+argRoute['Image'],
//             fit: BoxFit.cover,),
//           BackdropFilter(
//               filter: ui.ImageFilter.blur(sigmaX: 0.5,sigmaY: 0.5),
//             child: Container(
//               color: colorBlack.withOpacity(0.2),
//             ),
//           ),
//           Column(
//             children: [
//               Image.network(basicUrlImage+argRoute['Image'],
//                 fit: BoxFit.cover,
//                 height: MediaQuery.of(context).size.height/3,
//                 width: MediaQuery.of(context).size.width,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 50,
//                     child: Text("${argRoute["title"]}",style: TextStyle(
//                       color: colorWhite,
//                       fontSize: fontSize25
//                     ),),
//                   ),
//                   Expanded(
//                     flex: 30,
//                     child: Text("${argRoute["vote_average"]}",style: TextStyle(
//                       color: colorWhite,
//                       fontSize: fontSize25
//                     ),),
//                   ),
//                 ],
//               ),
//               Text("${argRoute["overview"]}",style: TextStyle(
//                   color: colorWhite,
//                   fontSize: 13
//               ),
//               )
//             ],
//           ),
//         ],
//       ),
//
//     );
//   }
// }
