import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'Profile.dart';

class TutorCard extends StatefulWidget {
  final String id;
  final String name;
  final String place;
  final String subject;
  final String aboutClass;
  final String fees;
  final String userId = "myUserId";

  const TutorCard({
    super.key,
    required this.id,
    required this.name,
    required this.place,
    required this.subject,
    required this.aboutClass,
    required this.fees,
  });

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  bool isHovered = false;
  final List<String> teachers = [
    'assets/Martha.jpg',
    'assets/afeef.webp',
    'assets/Charu.jpg',
    'assets/kiran.jpg',
    'assets/muneeb.jpg',
    'assets/tony.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: isHovered
            ? (Matrix4.identity()
              ..scale(1.05)
              ..translate(-10.0, -10.0))
            : Matrix4.identity(),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/profile',
              arguments: {
                'tutorId': widget.id,
                'name': widget.name,
                'place': widget.place,
                'subject': widget.subject,
                'aboutClass': widget.aboutClass,
                'fee': widget.fees,
              },
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.indigo,
            ),
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 340,
                      height: 430,
                      child: Image.asset(
                        teachers[widget.id.hashCode % teachers.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.userId)
                      .collection('wishlist')
                      .doc(widget.id)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    bool isWishlisted =
                        snapshot.hasData && snapshot.data!.exists;
                    return IconButton(
                        icon: Icon(
                          isWishlisted ? Icons.favorite : Icons.favorite_border,
                          color: isWishlisted ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          if (isWishlisted) {
                            removeFromWishlist(widget.id);
                          } else {
                            addToWishlist(
                              widget.id,
                              widget.name,
                              widget.subject,
                            );
                          }
                        });
                  },
                ),
                Positioned(
                  top: 236,
                  left: 20,
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 260,
                  left: 20,
                  child: Text(
                    widget.place,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 287,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(245, 197, 202, 233),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 120,
                    width: 339,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 6),
                          child: Container(
                            height: 20,
                            width: 320,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    widget.subject,
                                    style: const TextStyle(
                                        color: const Color.fromRGBO(
                                            76, 72, 158, 1),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'itim'),
                                  ),
                                ),
                                RatingBar.builder(
                                  itemCount: 5,
                                  allowHalfRating: true,
                                  itemSize: 17,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          const Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 255, 193, 7),
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 6),
                          child: SizedBox(
                            height: 55,
                            child: Text(
                              widget.aboutClass,
                              style: const TextStyle(
                                color: Color.fromARGB(163, 76, 72, 158),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 250, top: 5),
                          child: Text(
                            '₹${widget.fees} /hr',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(76, 72, 158, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addToWishlist(String tutorId, String tutorName, String tutorSubject) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('wishlist')
        .doc(tutorId)
        .set({
      'name': tutorName,
      'subject': tutorSubject,
      'addedAt': FieldValue.serverTimestamp(),
    });
  }

  void removeFromWishlist(String tutorId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('wishlist')
        .doc(tutorId)
        .delete();
  }
}
