import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lucidly_in/Responsive/teachersList.dart';

// ignore: must_be_immutable
class SubCarousel extends StatefulWidget {
  const SubCarousel({
    super.key,
  });

  @override
  State<SubCarousel> createState() => _SubCarouselState();
}

class _SubCarouselState extends State<SubCarousel> {
  Color? containerColor = Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'img': 'assets/english.png',
        'sub': 'English',
      },
      {
        'img': 'assets/hindi.png',
        'sub': 'Hindi',
      },
      {
        'img': 'assets/alphabet.png',
        'sub': 'Arabic',
      },
      {
        'img': 'assets/malayalm.png',
        'sub': 'Malayalam',
      },
      {
        'img': 'assets/atom.png',
        'sub': 'physics',
      },
      {
        'img': 'assets/experiment.png',
        'sub': 'Chemistry',
      },
      {
        'img': 'assets/geography.png',
        'sub': 'Geography',
      },
      {
        'img': 'assets/history.png',
        'sub': 'History',
      },
      {
        'img': 'assets/political-science.png',
        'sub': 'Politics',
      },
      {
        'img': 'assets/microscope (1).png',
        'sub': 'Biology',
      },
      {
        'img': 'assets/shree.png',
        'sub': 'Sanskrit',
      },
    ];

    return Container(
      height: 150, // Scrollable content
      color: const Color.fromARGB(255, 231, 231, 231),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Learn...!',
              style: TextStyle(
                  color: Color.fromRGBO(76, 72, 158, 1),
                  fontFamily: 'Itim',
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 100,
              width: 850,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  // height: MediaQuery.of(context).size.height * 0.15,
                  aspectRatio: 19 / 7,
                  viewportFraction: 0.17,
                ),
                items: items.map(
                  (items) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Teacherslist(
                                      subject: items['sub'],
                                    ),
                                  ),
                                );
                              },
                              hoverColor:
                                  const Color.fromARGB(255, 150, 146, 225),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    items['img'] ?? '',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.contain,
                                  ),
                                  Text(
                                    items['sub'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(76, 72, 158, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
