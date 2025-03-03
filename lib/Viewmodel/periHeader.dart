import 'package:flutter/material.dart';

// ignore: unused_element
class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 80; // Adjust as needed
  @override
  double get maxExtent => 80; // Fixed height to ensure space

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color.fromRGBO(236, 241, 244, 1), // Matches background
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
