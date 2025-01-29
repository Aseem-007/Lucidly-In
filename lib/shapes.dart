import 'package:flutter/material.dart';

class SquarishRectangle extends StatelessWidget {
  const SquarishRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SquarishRectangleClipper(),
      child: Container(
        width: 200,
        height: 100,
        color: Colors.blue, // Background color of the clipped shape
      ),
    );
  }
}

class SquarishRectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double squareSize = 20; // Size of the square cutout at each corner

    Path path = Path()
      ..moveTo(squareSize, 0) // Start after the top-left cutout
      ..lineTo(size.width - squareSize, 0) // Top edge
      ..lineTo(size.width, squareSize) // Top-right cutout
      ..lineTo(size.width, size.height - squareSize) // Right edge
      ..lineTo(size.width - squareSize, size.height) // Bottom-right cutout
      ..lineTo(squareSize, size.height) // Bottom edge
      ..lineTo(0, size.height - squareSize) // Bottom-left cutout
      ..lineTo(0, squareSize) // Left edge
      ..close(); // Close the path to complete the shape

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // No need to reclip unless size or shape changes
  }
}

//  SquarishRectangle(),
Widget stack() {
  return Stack(
    alignment: Alignment.center,
    children: [
      // Bottom layer (depth)
      Transform(
        transform: Matrix4.identity()
          ..translate(10.0, 10.0) // Shift to simulate depth
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.2)
          ..setRotationZ(50),
        child: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      // Top layer (main rectangle)
      Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade500,
              Colors.blue.shade300,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: Offset(5, 5),
              blurRadius: 15,
            ),
          ],
        ),
      ),
    ],
  );
}
 // Positioned(
                          //   // top: 30,
                          //   left: 1520,
                          //   bottom: 530,
                          //   child: Transform(
                          //     transform: Matrix4.identity()
                          //       // ..rotateX(2.5)
                          //       ..rotateZ(.72),
                          //     child: CustomPaint(
                          //       size: const Size(20, 400),
                          //       painter: DiagonalShapePainter(
                          //         path: Path()
                          //           ..moveTo(0, 0) // Top-left
                          //           ..lineTo(100, 0) // Top-right slanted
                          //           ..lineTo(75, 400) // Bottom-right
                          //           ..lineTo(-25, 320) // Bottom-left slanted
                          //           ..close(), // Clo
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // },
                          // );