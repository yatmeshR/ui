import 'package:flutter/material.dart';

Widget myTab(
    IconData imagePath,
    ) {
  return Container(
    height: 30,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),

      ),
      child:
          Icon(imagePath),

    ),
  );
}