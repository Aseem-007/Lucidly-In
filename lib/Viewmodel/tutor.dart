import 'package:cloud_firestore/cloud_firestore.dart';

class Tutor {
  final String id;
  final String name;
  final String place;
  final String subject;
  final String aboutClass;
  final String fees;

  Tutor({
    required this.id,
    required this.name,
    required this.place,
    required this.subject,
    required this.aboutClass,
    required this.fees,
  });

  factory Tutor.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Tutor(
      id: doc.id,
      name: data['Name'] ?? '',
      place: data['place'] ?? '',
      subject: data['subject'] ?? '',
      aboutClass: data['abClass'] ?? '',
      fees: data['fee'] ?? '',
    );
  }
}
