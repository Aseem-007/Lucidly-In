import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lucidly_in/Viewmodel/widgets.dart/tutorCard.dart';
// Import TutorCard

class TutorList extends StatelessWidget {
  final List<QueryDocumentSnapshot> tutors;

  const TutorList({Key? key, required this.tutors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling inside the grid
      shrinkWrap: true, // Allow it to be inside another scrollable view
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 cards per row
        crossAxisSpacing: 80,
        mainAxisSpacing: 40,
        childAspectRatio: 1 / 1.2, // Adjust size ratio of cards
      ),
      itemCount: tutors.length,
      itemBuilder: (context, index) {
        final tutorData = tutors[index];

        return TutorCard(
          id: tutorData.id,
          name: tutorData['Name'] ?? 'No Name',
          place: tutorData['place'] ?? 'No Place',
          subject: tutorData['subject'] ?? '',
          aboutClass: tutorData['abClass'] ?? '',
          fees: tutorData['fee'] ?? '',
        );
      },
    );
  }
}
