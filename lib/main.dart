import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:lucidly_in/Responsive/aboutUs.dart';
import 'package:lucidly_in/Responsive/loginPage.dart';
import 'package:lucidly_in/Responsive/register.dart';
import 'package:lucidly_in/Responsive/testing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lucidly_in/Viewmodel/Profile.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseRemoteConfig.instance.setDefaults({
    "Lc_login": "Login",
  });
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  runApp(const LucidlyApp());
  // runApp(const LucidlyApp());
}

class LucidlyApp extends StatelessWidget {
  const LucidlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lucidly',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'T',
      routes: {
        'T': (context) => const ScrollHideAppBar(),
        // '/': (context) => const MyHomePage(),
        '/aboutus': (context) => const AboutUs(),
        '/register': (context) => RegistePage(),
        '/login': (context) => LoginPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/profile') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ProfilePage(
              tutorId: args['tutorId'],
              name: args['name'],
              place: args['place'],
              subject: args['subject'],
              aboutClass: args['aboutClass'],
              fee: args['fee'],
            ),
          );
        }
        return null;
      },
    );
  }
}
