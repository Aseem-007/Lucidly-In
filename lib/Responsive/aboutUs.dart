// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  late AnimationController _popupController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );

    _positionAnimation = Tween<double>(begin: 300, end: 180).animate(
      CurvedAnimation(
          parent: _controller, curve: Curves.fastEaseInToSlowEaseOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.2, curve: Curves.ease),
      ),
    );

    // //Popup controller
    _popupController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    //Animation for pop-up effect
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _popupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 217, 217, 217),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/hly.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: Transform.translate(
                        offset: Offset(0, _positionAnimation.value),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      aboutMesg(
                        'At Lucidly, We believe that qaulity education should be accessible, personalized\nand flexible.Our platform connects K-12 students with qualified tutors, enabling\none-on-one learning that adapts to individual needs.\n',
                      ),
                      aboutMesg(
                        'We empower students by giving them the freedom to choose their tutors, learn\nat their own pace, and pay per session—no long-term commitments. At the \nsame time, we provide tutors with the opportunity to earn flexibly, set their own.\nrates and schedules, and reach a wider audience.\n',
                      ),
                      aboutMesg(
                          'With verified educators, AI-powered matchmaking, and a seamless learning \nexperience, Lucidly is reshaping the way students learn and excel. Join us in \nbuilding a future where education works for everyone!.')
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 350,
                child: AnimatedBuilder(
                  animation: _popupController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation
                          .value, // Apply the pop-up scale only to the "About Us" text
                      child: child,
                    );
                  },
                  child: const Text(
                    'About Us!',
                    style: TextStyle(
                        color: Color.fromRGBO(76, 72, 158, 1),
                        fontFamily: 'InterSemi',
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget aboutMesg(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Color.fromRGBO(76, 72, 158, 1),
      fontFamily: 'InterSemi',
      fontSize: 17,
    ),
  );
}
