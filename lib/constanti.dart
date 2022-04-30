import 'package:flutter/material.dart';

const Color toastColorError = Colors.white;
const Color toastBackColorError = Colors.red;
const Color NormalText = Colors.black;


const kHintTextStyle = TextStyle(
  //color: Color(0xFF527DAA),
  color: Colors.black,
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.white,
      blurRadius: 10.0,
      offset: Offset(0,5),
    ),
  ],
);