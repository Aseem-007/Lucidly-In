import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lucidly_in/Responsive/teachersList.dart';
import 'package:lucidly_in/Viewmodel/widgets.dart/popUp.dart';

class ProfilePage extends StatelessWidget {
  // final Tutor tutor;

  final String tutorId;
  final String name;
  final String place;
  final String subject;
  final String aboutClass;
  final String fee;

  const ProfilePage({
    super.key,
    // required this.tutor,
    required this.tutorId,
    required this.name,
    required this.place,
    required this.subject,
    required this.aboutClass,
    required this.fee,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 243, 249),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(213, 207, 225, 232),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(162, 159, 168, 218),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 100,
                          top: 40,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(151, 168, 157, 203),
                              ),
                              height: 150,
                              width: 130,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.person,
                                ),
                                // child: Image.asset(
                                //   'assets/shebiba.png', fit: BoxFit.cover,
                                //   height: 150,
                                //   width: 110,
                                //   // fit: BoxFit.fill,
                                // ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'itim'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 25),
                        child: Container(
                          height: 147,
                          width: width * .0999,
                          // color: Colors.white60,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Fee:',
                                    style: TextStyle(
                                      color: Colors.indigo[900],
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '$fee₹/hr',
                                    style: TextStyle(
                                      color: Colors.indigo[900],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subject: ',
                                    style: TextStyle(
                                      color: Colors.indigo[900],
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    subject,
                                    style: TextStyle(
                                      color: Colors.indigo[900],
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                width: 185,
                                height: 30,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 61, 70, 121),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ), // Adjust the radius here
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Contact',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Icon(
                                        size: 20,
                                        Icons.message,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 240),
                        child: Text(
                          '"Arabic is a beautiful and ancient language spoken\nby millions worldwide.It has a rich history,\ndeep cultural significance,and is the language of the Quran"',
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Itim'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 70),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About tutor:',
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hello everyone! Im teacher, and I’ll be your english teacher.I love making learning fun and interactive,\nso expect a lot of discussions,activities, and challenges. My goal is to help you learn, grow, and enjoy\nthe process.Let’s work together to make this an amazing experience!"',
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Reviews:",
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 300,
                                  width: 450,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: 1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: Text(
                                          '   Reviewer:',
                                          style: TextStyle(
                                            color: Colors.indigo[900],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Mr. Rajesh is an incredible teacher who truly cares about\nhis students. He takes the time to explain concepts\nin a way that makes them easy to understand. His classes\nare interactive, and he always encourages students to ask\nquestions.Thanks to his guidance,I gained confidence in my\nstudies',
                                              style: TextStyle(
                                                color: Colors.indigo[900],
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 300,
                                  width: 450,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: 1),
                                  ),
                                ),
                                Container(
                                  height: 300,
                                  width: 450,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 9, 4, 31),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: 250,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 150,
                          // top: 20,
                          bottom: 20,
                        ),
                        child: Container(
                          color: const Color.fromARGB(0, 33, 149, 243),
                          height: 100,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      if (states
                                          .contains(WidgetState.hovered)) {
                                        return const Color.fromARGB(255, 213,
                                            213, 213); // Color when hovered
                                      }
                                      return const Color.fromARGB(
                                          255, 53, 67, 145); // Default color
                                    },
                                  ),
                                  overlayColor: WidgetStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/aboutus');
                                },
                                child: const Text(
                                  'Who are we?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  minimumSize: WidgetStateProperty.all(
                                      const Size(50, 1)),
                                  foregroundColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      if (states
                                          .contains(WidgetState.hovered)) {
                                        return const Color.fromARGB(255, 213,
                                            213, 213); // Color when hovered
                                      }
                                      return const Color.fromARGB(
                                          255, 53, 67, 145); // Default color
                                    },
                                  ),
                                  overlayColor: WidgetStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Terms & conditions',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, left: 10),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Follow us',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.facebook,
                                    color: Colors.white60,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/instagram.png',
                                    height: 18,
                                    width: 18,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                      'assets/linkedin.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _confirmDelete(context, tutorId),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, String tutorId) {
    showPopup(
      ctx: context,
      tiltle: 'Confirm Deletion',
      subtilte: 'Are you sure you want to delete this profile?',
      confirmTitle2: 'Delete',
      onPressed1: () => Navigator.pop(context),
      confirmTitle1: 'No',
      onPressed2: () {
        removeprofile(tutorId);
        Navigator.of(context).pop();
      },
    );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: const Text('Confirm Deletion'),
    //       content: const Text('Are you sure you want to delete this profile?'),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: const Text('Cancel'),
    //         ),
    //         TextButton(
    //           onPressed: () {
    //             removeprofile(tutorId);
    //             Navigator.of(context).pop();
    //             Navigator.of(context).pop(); // Navigate back after deletion
    //           },
    //           child: const Text('Delete'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  void removeprofile(String tutorId) {
    FirebaseFirestore.instance.collection('teachers').doc(tutorId).delete();
  }
}
