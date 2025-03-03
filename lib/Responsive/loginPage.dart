import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final bool _isDataMatched = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: headingText(title: 'Sign In'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'hi welcome back',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(240, 60, 60, 234),
                      fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.indigo[400],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                height: 400,
                width: width * 350 / width,
                child: Form(
                  // key: ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 230,
                        ),
                        child: headingText(
                            title: 'Email',
                            paddingRight:
                                MediaQuery.of(context).size.width * .01),
                      ),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: TextFormField(
                          controller: usernameController,
                          validator: (_) => _isDataMatched ? null : "Error",
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 143, 131, 211),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 190),
                        child: headingText(
                          paddingRight: width * 0.01,
                          title: 'password',
                        ),
                      ),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: TextFormField(
                          validator: (_) => _isDataMatched ? null : "Error",
                          controller: passwordController,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 143, 131, 211),
                            ),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.visibility),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: headingText(
                              title: 'Forgot password',
                              paddingRight: width * 0.01,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 68, 35, 214),
                          minimumSize: const Size(330, 60),
                        ),
                        onPressed: () {
                          // loginCheck(context);
                        },
                        child: headingText(
                          title: 'Sign in',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'or sign in with',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'kanit',
                  color: Color.fromARGB(255, 40, 40, 123),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget roundButton(String img) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        minimumSize: const Size(50, 50)),
    child: Image.asset(
      img,
      height: 30,
      width: 30,
    ),
  );
}

Widget headingText({
  String? title,
  double fontSize = 20,
  FontWeight? fontWeight = FontWeight.bold,
  double? paddingTop = 0,
  double? paddingBottom = 0,
  double? paddingLeft = 0,
  double? paddingRight = 0,
}) {
  return Padding(
    padding: EdgeInsets.only(
      right: paddingRight!,
      left: paddingLeft!,
      top: paddingTop!,
      bottom: paddingBottom!,
    ),
    child: Text(
      title!,
      style: TextStyle(
        color: const Color.fromARGB(240, 40, 40, 123),
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'kanit',
      ),
    ),
  );
}
