import 'package:flutter/material.dart';

class Iconbutton extends StatelessWidget {
  final String img;
  final String? msg;
  final VoidCallback onPressed;
  const Iconbutton(
      {super.key, required this.img, required this.onPressed, this.msg});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color.fromARGB(153, 208, 208, 208),
      ),
      message: msg,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 20,
          width: 20,
          child: Image.asset(
            img,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
