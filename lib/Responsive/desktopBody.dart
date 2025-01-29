import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucidly_in/Viewmodel/carousel.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({
    super.key,
  });

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  final ScrollController _scrollController = ScrollController();
  bool _isSliverAppBarVisible = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 600) {
        if (!_isSliverAppBarVisible) {
          setState(
            () {
              _isSliverAppBarVisible = true;
            },
          );
        }
      } else {
        if (_isSliverAppBarVisible) {
          setState(
            () {
              _isSliverAppBarVisible = false;
            },
          );
        }
      }
    });
  }

  List<String> sub = ['english', 'math', 'chemistry'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 217, 217, 217),
              toolbarHeight: 80,
              pinned: true,
              title: Visibility(
                visible: _isSliverAppBarVisible,
                child: const Text(
                  'Lucidly',
                  style: TextStyle(
                    fontFamily: 'InterSemi',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(76, 72, 158, 1),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Visibility(
                    visible: _isSliverAppBarVisible,
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
                                Radius.circular(4) // Bottom-right corner radius
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
                                      4) // Bottom-right corner radius
                                  ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Itim',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _isSliverAppBarVisible,
                  child: Tooltip(
                    message: 'about us',
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "About Us",
                        style: TextStyle(
                          color: Color.fromRGBO(76, 72, 158, 1),
                          fontFamily: 'Itim',
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                )
              ],
              // Keeps the AppBar visible when scrolled up
              floating: true,
              expandedHeight: height * 1,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: width,
                        child: SvgPicture.asset(
                          'assets/hly.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height * 0.33),
                        child: Text(
                          'Lucidly',
                          style: TextStyle(
                            color: const Color.fromRGBO(76, 72, 158, 1),
                            fontSize: width * .06,
                            fontFamily: 'InterSemi',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 774,
                      top: 208,
                      child: Image.asset(
                        'assets/LucidLg.png',
                        height: 15.5,
                        width: 15.5,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:
                            EdgeInsets.only(bottom: height * .21, right: 35),
                        child: Text(
                          'Where Clarity Meets Authority',
                          style: TextStyle(
                            color: const Color.fromRGBO(76, 72, 158, 1),
                            letterSpacing: 1,
                            fontSize: width * .0114,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 600,
                        height: 50,
                        child: SearchAnchor(builder: (BuildContext context,
                            SearchController controller) {
                          return SearchBar(
                            controller: controller,
                            onTap: () {
                              controller.openView();
                            },
                            leading: const Icon(Icons.search),
                            hintText: 'Find the best teacher for you',
                          );
                        }, suggestionsBuilder:
                            (BuildContext context, SearchController) {
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
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // body starts here
            SliverToBoxAdapter(
              child: SubCarousel(),
            )
          ],
        ),
      ),
    );
  }
}
