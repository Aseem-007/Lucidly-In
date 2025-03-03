import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucidly_in/Responsive/whislist.dart';

import 'package:lucidly_in/Viewmodel/widgets.dart/carousel.dart';

import 'package:lucidly_in/Viewmodel/tutorList.dart';
import 'package:lucidly_in/Viewmodel/widgets.dart/iconButton.dart';
import 'package:lucidly_in/Viewmodel/widgets.dart/textButton.dart';

class ScrollHideAppBar extends StatefulWidget {
  const ScrollHideAppBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScrollHideAppBarState createState() => _ScrollHideAppBarState();
}

class _ScrollHideAppBarState extends State<ScrollHideAppBar> {
  final CollectionReference teachers =
      FirebaseFirestore.instance.collection('teachers');

  bool _showAppBar = false;
  double _lastOffset = 0.0;
  // final double _hideThreshold = 200.0;

  List<String> sub = ['english', 'math', 'chemistry'];

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final remoteConfig = FirebaseRemoteConfig.instance;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 230, 230),
      body: SafeArea(
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  if (scrollNotification.metrics.pixels > _lastOffset) {
                    // Scrolling down -> Show AppBar
                    setState(() => _showAppBar = true);
                  } else {
                    // Scrolling up -> Hide AppBar
                    setState(() => _showAppBar = false);
                  }
                  _lastOffset = scrollNotification.metrics.pixels;
                }
                return false;
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: width,
                            height: height,
                            child: SvgPicture.asset(
                              'assets/hly.svg',
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                          Positioned(
                            top: 220,
                            left: 450,
                            child: SizedBox(
                              width: 600,
                              height: 250,
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Lucidly',
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              76, 72, 158, 1),
                                          fontSize: width * .06,
                                          fontFamily: 'InterSemi',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 600,
                                        height: 50,
                                        child: SearchAnchor(
                                          builder: (BuildContext context,
                                              SearchController controller) {
                                            return SearchBar(
                                              controller: controller,
                                              onTap: () {
                                                controller.openView();
                                              },
                                              leading: const Icon(Icons.search),
                                              hintText:
                                                  'Find the best teacher for you',
                                            );
                                          },
                                          suggestionsBuilder:
                                              (BuildContext context,
                                                  SearchController) {
                                            return List<ListTile>.generate(
                                              sub.length,
                                              (int index) {
                                                final String item = sub[index];
                                                return ListTile(
                                                  title: Text(item),
                                                  onTap: () {},
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    left: width * .096,
                                    top: 100,
                                    child: Text(
                                      'Find Your Perfect Tutor,Anytime',
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                            76, 72, 158, 1),
                                        letterSpacing: .5,
                                        fontSize: width * .0114,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: width * .1985,
                                    top: height * .036,
                                    child: Image.asset(
                                      'assets/LucidLg.png',
                                      height: 15.5,
                                      width: 15.5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: SubCarousel(),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(top: 35, left: 180, right: 180),
                    // padding: const EdgeInsets.symmetric(horizontal: 180),
                    sliver: StreamBuilder<QuerySnapshot>(
                      stream: teachers.snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const SliverFillRemaining(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return SliverToBoxAdapter(
                          child: Column(
                            children: [
                              TutorList(tutors: snapshot.data!.docs),
                              const SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/register'),
                                child: Container(
                                  height: 200,
                                  width: width * .95,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Color.fromARGB(255, 68, 88, 202),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/artwork.png',
                                          width: width * .95,
                                          fit: BoxFit.fill,
                                        ),
                                        const Positioned(
                                          top: 30,
                                          left: 22,
                                          child: Text(
                                            'Register now and\nbecome a teacher',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 47,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Itim'),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 150, bottom: 10),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              '\"Tab me!\"',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: 'Itim'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 9, 4, 31),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        height: 250,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 150,
                                  // top: 20,
                                  bottom: 20,
                                ),
                                child: Container(
                                  color: const Color.fromARGB(0, 33, 149, 243),
                                  height: 100,
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 12),
                                        child: Text(
                                          'About',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Textbutton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/aboutus');
                                        },
                                        text: 'Who are we',
                                      ),
                                      Textbutton(
                                        onPressed: () {},
                                        text: 'Terms & conditions',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 65, left: 10),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Follow us',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Iconbutton(
                                          msg: 'Facebook',
                                          img: 'assets/fb.png',
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Iconbutton(
                                          msg: 'Instagram',
                                          img: 'assets/instagram.png',
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Iconbutton(
                                          msg: 'LinkedIn',
                                          img: 'assets/linkedin.png',
                                          onPressed: () {},
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Animated AppBar visibility
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top:
                  _showAppBar ? 0 : -80, // Adjust the height to hide the AppBar
              left: 0,
              right: 0,
              child: AppBar(
                toolbarHeight: 80,
                title: const Text(
                  'Lucidly',
                  style: TextStyle(
                    fontFamily: 'InterSemi',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(76, 72, 158, 1),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(164, 89, 161, 1),
                            Color.fromRGBO(76, 72, 158, 100)
                          ], // Two colors for the gradient
                          begin: Alignment
                              .topLeft, // Start position of the gradient
                          end: Alignment
                              .bottomRight, // End position of the gradient
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(15), // Top-left corner radius
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(4),
                          bottomLeft:
                              Radius.circular(4), // Bottom-right corner radius
                        ),
                      ),
                      child: Tooltip(
                        message: 'Login',
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent, //
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    15), // Top-left corner radius
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(4),
                                bottomLeft: Radius.circular(
                                    4), // Bottom-right corner radius
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            remoteConfig.getString(
                              'Lc_login',
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Itim',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'Whislist',
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Color.fromRGBO(76, 72, 158, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WishlistScreen(),
                          ),
                        );
                      },
                    ),
                  )
                ],
                backgroundColor: const Color.fromARGB(205, 186, 196, 204),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
