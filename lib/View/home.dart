import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucidly_in/Responsive/desktopBody.dart';
import 'package:lucidly_in/Responsive/mobileBody.dart';
import 'package:lucidly_in/Responsive/responsiveLt.dart';

// import 'package:lucidly_in/shapes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 241, 244),
      // body: ResponsiveLayout(
      //   mobileBody: MobileView(),
      //   // desktopBody: DesktopView(),
      // ),
    );
  }
}
