import 'package:flutter/material.dart';

class BannerBgCustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    
    path.lineTo(0.0, size.height-80);

    var firstControlPoint = new Offset(size.width/3, size.height);
    var firstEndPoint = new Offset(size.width, size.height-190);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    firstEndPoint.dx, firstEndPoint.dy);
    
    path.lineTo(size.width, size.height-120);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
