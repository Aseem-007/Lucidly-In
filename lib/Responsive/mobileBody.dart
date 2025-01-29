import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MobileView extends StatefulWidget {
  const MobileView({
    super.key,
  });

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
              ],
              // Keeps the AppBar visible when scrolled up
              floating: true,
              expandedHeight: 800,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/hly.svg',
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height * 0.98),
                        child: Text(
                          'Lucidly',
                          style: TextStyle(
                            color: const Color.fromRGBO(76, 72, 158, 1),
                            fontSize: width * .1,
                            fontFamily: 'InterSemi',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 773,
                      top: 238,
                      child: Image.asset(
                        'assets/LucidLg.png',
                        height: 15.5,
                        width: 15.5,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: height * 0.92, right: width * .05),
                        child: Text(
                          'Where Clarity Meets Authority',
                          style: TextStyle(
                            color: const Color.fromRGBO(76, 72, 158, 1),
                            // letterSpacing: 1,
                            fontSize: width * .02,
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
            SliverToBoxAdapter(
              child: Container(
                height: 650, // Scrollable content
                color: Colors.grey[200],
                child: const Center(
                  child: Text(
                    "Scroll this container!",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
