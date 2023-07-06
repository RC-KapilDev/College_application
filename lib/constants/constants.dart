import 'package:flutter/material.dart';

const kheadingprogress = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontFamily: 'Noto Serif',
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.lightBlue,
  minimumSize: const Size(88, 36),
  shadowColor: Colors.lightBlue,
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
