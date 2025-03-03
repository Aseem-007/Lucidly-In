import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Textbutton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  const Textbutton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return const Color.fromARGB(
                  255, 213, 213, 213); // Color when hovered
            }
            return const Color.fromARGB(255, 53, 67, 145); // Default color
          },
        ),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }
}
