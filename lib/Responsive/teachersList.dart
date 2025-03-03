import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucidly_in/Viewmodel/tutorList.dart';

class Teacherslist extends StatelessWidget {
  final dynamic subject;

  const Teacherslist({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$subject tutoers'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('teachers')
            .where('subject', isEqualTo: subject)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No teachers found for $subject'));
          }
          return Padding(
            padding: const EdgeInsets.only(top: 35, left: 180, right: 180),
            child: TutorList(tutors: snapshot.data!.docs),
          );
        },
      ),
    );
  }
}
