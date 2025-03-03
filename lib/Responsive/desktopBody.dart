// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lucidly_in/Viewmodel/carousel.dart';
// import 'package:lucidly_in/Viewmodel/periHeader.dart';

// class DesktopView extends StatefulWidget {
//   const DesktopView({
//     super.key,
//   });

//   @override
//   State<DesktopView> createState() => _DesktopViewState();
// }

// class _DesktopViewState extends State<DesktopView> {
//   final CollectionReference teachers =
//       FirebaseFirestore.instance.collection('teachers');

//   final ScrollController _scrollController = ScrollController();
//   bool _isSliverAppBarVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.offset > 600) {
//         if (!_isSliverAppBarVisible) {
//           setState(
//             () {
//               _isSliverAppBarVisible = true;
//             },
//           );
//         }
//       } else {
//         if (_isSliverAppBarVisible) {
//           setState(
//             () {
//               _isSliverAppBarVisible = false;
//             },
//           );
//         }
//       }
//     });
//   }

//   List<String> sub = ['english', 'math', 'chemistry'];

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(236, 241, 244, 1),
//       body: SafeArea(
//         child: CustomScrollView(
//           controller: _scrollController,
//           slivers: [
//             SliverAppBar(
//               elevation: 5,
//               backgroundColor: const Color.fromARGB(255, 217, 217, 217),
//               toolbarHeight: 80,
//               pinned: true,
//               floating: true,
//               expandedHeight: height * 1,
//               title: Visibility(
//                 visible: _isSliverAppBarVisible,
//                 child: const Text(
//                   'Lucidly',
//                   style: TextStyle(
//                     fontFamily: 'InterSemi',
//                     fontSize: 30,
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromRGBO(76, 72, 158, 1),
//                   ),
//                 ),
//               ),
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 20),
//                   child: Visibility(
//                     visible: _isSliverAppBarVisible,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color.fromRGBO(164, 89, 161, 1),
//                             Color.fromRGBO(76, 72, 158, 100)
//                           ], // Two colors for the gradient
//                           begin: Alignment
//                               .topLeft, // Start position of the gradient
//                           end: Alignment
//                               .bottomRight, // End position of the gradient
//                         ),
//                         borderRadius: BorderRadius.only(
//                             topLeft:
//                                 Radius.circular(15), // Top-left corner radius
//                             bottomRight: Radius.circular(15),
//                             topRight: Radius.circular(4),
//                             bottomLeft:
//                                 Radius.circular(4) // Bottom-right corner radius
//                             ),
//                       ),
//                       child: Tooltip(
//                         message: 'Login',
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent,
//                             shadowColor: Colors.transparent, //
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(
//                                       15), // Top-left corner radius
//                                   bottomRight: Radius.circular(15),
//                                   topRight: Radius.circular(4),
//                                   bottomLeft: Radius.circular(
//                                       4) // Bottom-right corner radius
//                                   ),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: const Text(
//                             'LOGIN',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Itim',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: _isSliverAppBarVisible,
//                   child: Tooltip(
//                     message: 'about us',
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/aboutus');
//                       },
//                       child: const Text(
//                         "About Us",
//                         style: TextStyle(
//                           color: Color.fromRGBO(76, 72, 158, 1),
//                           fontFamily: 'InterSemi',
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//               flexibleSpace: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//                 child: FlexibleSpaceBar(
//                   collapseMode: CollapseMode.pin,
//                   background: LayoutBuilder(
//                     builder: (context, constraints) {
//                       // final maxHeight = constraints.maxHeight;
//                       return Stack(
//                         children: [
//                           Positioned.fill(
//                             child: Transform.scale(
//                               scale: 1.03, // Adjust scale factor as needed
//                               child: SvgPicture.asset(
//                                 'assets/hly.svg',
//                                 fit: BoxFit.cover,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.center,
//                             child: Padding(
//                               padding: EdgeInsets.only(bottom: height * 0.33),
//                               child: Text(
//                                 'Lucidly',
//                                 style: TextStyle(
//                                   color: const Color.fromRGBO(76, 72, 158, 1),
//                                   fontSize: width * .06,
//                                   fontFamily: 'InterSemi',
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             left: width * 0.5035,
//                             top: height * 0.282,
//                             child: Image.asset(
//                               'assets/LucidLg.png',
//                               height: 15.5,
//                               width: 15.5,
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.center,
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                 bottom: height * .21,
//                                 right: 38,
//                               ),
//                               child: Text(
//                                 'Find Your Perfect Tutor,Anytime',
//                                 style: TextStyle(
//                                   color: const Color.fromRGBO(76, 72, 158, 1),
//                                   letterSpacing: .5,
//                                   fontSize: width * .0114,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.center,
//                             child: SizedBox(
//                               width: 600,
//                               height: 50,
//                               child: SearchAnchor(
//                                 builder: (BuildContext context,
//                                     SearchController controller) {
//                                   return SearchBar(
//                                     controller: controller,
//                                     onTap: () {
//                                       controller.openView();
//                                     },
//                                     leading: const Icon(Icons.search),
//                                     hintText: 'Find the best teacher for you',
//                                   );
//                                 },
//                                 suggestionsBuilder:
//                                     (BuildContext context, SearchController) {
//                                   return List<ListTile>.generate(
//                                     sub.length,
//                                     (int index) {
//                                       final String item = sub[index];
//                                       return ListTile(
//                                         title: Text(item),
//                                         onTap: () {},
//                                       );
//                                     },
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),

//             // body starts here
//             SliverPadding(
//               padding: const EdgeInsets.only(top: 0),
//               sliver: SliverList(
//                 delegate: SliverChildListDelegate(
//                   [
//                     Container(
//                       decoration: const BoxDecoration(
//                         color: Color.fromRGBO(236, 241, 244, 1),
//                       ),
//                       width: width,
//                       height: height * 1.5,
//                       child: Column(
//                         children: [
//                           const SubCarousel(),
//                           Expanded(
//                             child: StreamBuilder(
//                               stream: teachers.snapshots(),
//                               builder: (
//                                 context,
//                                 AsyncSnapshot snapshot,
//                               ) {
//                                 if (snapshot.hasData) {
//                                   return Padding(
//                                     padding: const EdgeInsets.only(top: 60),
//                                     child: GridView.count(
//                                       crossAxisSpacing: 80,
//                                       mainAxisSpacing: 3,
//                                       primary: false,
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 180),
//                                       crossAxisCount: 3,
//                                       childAspectRatio: 1 / 1.2,
//                                       children: List.generate(
//                                         snapshot.data!.docs.length,
//                                         (index) {
//                                           final DocumentSnapshot tutorData =
//                                               snapshot.data!.docs[index];
//                                           return IntrinsicWidth(
//                                             stepWidth: 50,
//                                             child: Container(
//                                               decoration: const BoxDecoration(
//                                                 borderRadius: BorderRadius.all(
//                                                   Radius.circular(20),
//                                                 ),
//                                                 color: Colors.indigo,
//                                               ),
//                                               // height: 50,width: 50,
//                                               child: Stack(
//                                                 children: [
//                                                   Center(
//                                                     child: Image.asset(
//                                                       height: 420,
//                                                       width: 390,
//                                                       'assets/shebiba.png',
//                                                       // fit: BoxFit.cover,
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     tutorData['Name'],
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           );

//                                           // },
//                                         },
//                                       ),
//                                     ),
//                                   );
//                                 }
//                                 return Container();
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         tooltip: 'Register as a teacher',
//         backgroundColor: const Color.fromRGBO(76, 72, 158, 1),
//         foregroundColor: const Color.fromARGB(255, 204, 202, 233),
//         hoverColor: const Color.fromARGB(255, 78, 72, 186),
//         onPressed: () {
//           Navigator.pushNamed(context, '/register');
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
