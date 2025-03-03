import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucidly_in/Viewmodel/widgets.dart/dropdown.dart';
// import 'package:lucidly_in/Viewmodel/popUp.dart';

class RegistePage extends StatefulWidget {
  RegistePage({super.key});

  @override
  State<RegistePage> createState() => _RegistePageState();
}

class _RegistePageState extends State<RegistePage> {
  String? selectedSub;
  String? selectedPlace;
  final CollectionReference teachers =
      FirebaseFirestore.instance.collection('teachers');
  int wordsPerLine = 3; // Change this to set words per line

  TextEditingController aboutClass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController fee = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();

  final List<String> places = [
    "Malappuram",
    "Kannur",
    "Kasargod",
    "Kozhikode",
    "Thrissur",
    "Ernankulam",
    "Palakkad",
    "Kollam",
    "Kottayam",
    "Trivandrum"
  ];
  final List<String> subjects = [
    'English',
    'Maths',
    'Arabic',
    'Hindi',
    'Malayalam',
    'Physics',
    'Chemistry',
    'Biology'
  ];

  @override
  void initState() {
    super.initState();
    aboutClass.addListener(() {
      // onTextChanged(aboutClass.text);
    });
    containers = [
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Enter your personal details',
              style: TextStyle(
                  fontFamily: 'InterSemi',
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            textField(
              hint: 'Name',
              keyboardtype: TextInputType.text,
              controller: name,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            Dropdown(
              hintText: 'Select place',
              items: places,
              selectedValue: selectedPlace,
              onChanged: (value) {
                setState(() {
                  selectedPlace = value;
                });
              },
            ),
          ],
        ),
      ),
      Form(
        key: _formKey2,
        child: Column(
          children: [
            Dropdown(
              hintText: 'Select place',
              items: subjects,
              selectedValue: selectedSub,
              onChanged: (value) {
                setState(() {
                  selectedSub = value;
                });
              },
            ),
            textField(
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please add a note';
                }
              },
              controller: aboutClass,
              hint: 'Add something about your class',
              max: null,
            ),
          ],
        ),
      ),
      Form(
        key: _formKey3,
        child: textField(
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Your fee';
              }
            },
            hint: 'Enter your fee',
            keyboardtype: TextInputType.number,
            rs: '₹',
            controller: fee),
      )
    ];
  }

  // void onTextChanged(String value) {
  //   List<String> words = value.split(' '); // Split words by space
  //   String formattedText = '';

  //   for (int i = 0; i < words.length; i++) {
  //     formattedText += '${words[i]} ';
  //     if ((i + 1) % wordsPerLine == 0) {
  //       // Insert new line after every 3 words
  //       formattedText += '\n';
  //     }
  //   }

  //   if (formattedText.trim() != value) {
  //     aboutClass.value = TextEditingValue(
  //       text: formattedText.trim(),
  //       selection: TextSelection.fromPosition(
  //         TextPosition(offset: formattedText.trim().length),
  //       ),
  //     );
  //   }
  // }

  int _currentIndex = 0;

  late List<Widget> containers;

  void _nextContainer() {
    if (_currentIndex == 0) {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _currentIndex++;
        });
      }
    } else if (_currentIndex == 1) {
      if (_formKey2.currentState!.validate()) {
        setState(() {
          _currentIndex++;
        });
      }
    } else if (_currentIndex == 2) {
      if (_formKey3.currentState!.validate()) {
        addTeacher(); // This will handle navigation internally
      }
    }
  }

  void _previousContainer() {
    setState(
      () {
        _currentIndex = (_currentIndex - 1) % containers.length;
      },
    );
  }

  bool isSubmitting = false;

  void addTeacher() async {
    if (isSubmitting) return; // Prevent multiple clicks

    final tName = name.text;

    final tAboutClass = aboutClass.text;
    final tFee = fee.text;

    if (tName.isEmpty ||
        tAboutClass.isEmpty ||
        selectedPlace == null ||
        selectedSub == null ||
        tFee.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() => isSubmitting = true); // Start submission

    try {
      await teachers.add(
        {
          'Name': tName,
          'place': selectedPlace,
          'subject': selectedSub,
          'abClass': tAboutClass,
          'fee': tFee,
          'createdAt': FieldValue.serverTimestamp(),
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Teacher added successfully!'),
        ),
      );
      name.clear();
      aboutClass.clear();
      fee.clear();
      setState(() {
        selectedPlace = null;
        selectedSub = null;
      });

      // Navigate after submission
      Navigator.pushReplacementNamed(context, 'T');
    } catch (error) {
      print('Failed to add teacher: $error');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save data: $error')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isSubmitting = false); // Reset button state
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/Tchr&stnd.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 465),
              child: Container(
                width: MediaQuery.of(context).size.width * .7,
                height: MediaQuery.of(context).size.height * .65,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(100, 300),
                    bottomLeft: Radius.elliptical(100, 300),
                  ),
                  color: const Color.fromARGB(166, 172, 181, 247),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color
                      blurRadius: 3, blurStyle: BlurStyle.normal,
                      spreadRadius: 3, // How much the shadow spreads
                      // offset: Offset(5, 5), // Position of the shadow (X, Y)
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .28,
                          height: MediaQuery.of(context).size.height * .55,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.elliptical(100, 300),
                              bottomLeft: Radius.elliptical(100, 300),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Color.fromARGB(150, 39, 53, 160),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              containers[_currentIndex],
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 50,
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              _previousContainer();
                                            },
                                          );
                                        },
                                        child: const Icon(Icons.arrow_back),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: 40,
                                      width: 50,
                                      child: FloatingActionButton(
                                        onPressed: isSubmitting
                                            ? null
                                            : () {
                                                setState(() {
                                                  _nextContainer();
                                                });
                                              },
                                        child: isSubmitting
                                            ? const CircularProgressIndicator()
                                            : const Icon(Icons.arrow_forward),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 100),
                        child: Text(
                          '"Become a\n students\n favourite"',
                          style: TextStyle(
                              fontFamily: 'Itim',
                              fontWeight: FontWeight.w700,
                              fontSize: 40),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textField({
    validate,
    TextInputType? keyboardtype,
    required String? hint,
    TextEditingController? controller,
    int? max,
    dynamic rs,
    bool isNumeric = false,
  }) {
    return SizedBox(
      width: 300,
      height: 70,
      child: TextFormField(
        validator: validate,
        keyboardType: keyboardtype,
        maxLines: max,
        controller: controller,
        inputFormatters: isNumeric
            ? [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d{0,2}$'),
                ), // Allows numbers with 2 decimal places
              ]
            : [],
        decoration: InputDecoration(
          prefixText: rs,
          labelText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 158, 160, 192), width: 1.0),
          ),
        ),
      ),
    );
  }
}
