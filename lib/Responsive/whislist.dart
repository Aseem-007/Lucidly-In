import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WishlistScreen extends StatelessWidget {
  final String userId = "myUserId"; // Your fixed user ID for now

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('wishlist')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No tutors in wishlist"));
          }

          return ListView.separated(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var wishlistTutor = snapshot.data!.docs[index];
              String tutorId = wishlistTutor.id; // Fetch tutor ID

              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('teachers')
                    .doc(tutorId)
                    .get(),
                builder: (context, tutorSnapshot) {
                  if (!tutorSnapshot.hasData || !tutorSnapshot.data!.exists) {
                    // return ListTile(title: Text("Tutor not found"));
                    return Container(
                      height: 0,
                      width: 0,
                    );
                  }

                  var tutor = tutorSnapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      leading: const CircleAvatar(
                        child: Icon(
                          Icons.person,
                        ),
                        // backgroundImage: AssetImage(),
                      ),
                      title: Text(tutor['Name']),
                      subtitle: Text(tutor['subject']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeFromWishlist(tutorId),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/profile',
                          arguments: {
                            'tutorId': tutor.id,
                            'name': tutor['Name'] ?? '',
                            'place': tutor['place'] ?? '',
                            'subject': tutor['subject'] ?? '',
                            'aboutClass': tutor['abClass'] ?? '',
                            'fee': tutor['fee'] ?? '',
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 20),
          );
        },
      ),
    );
  }

  void _removeFromWishlist(String tutorId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('wishlist')
        .doc(tutorId)
        .delete();
  }
}
