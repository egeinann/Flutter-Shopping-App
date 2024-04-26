import 'package:flutter/material.dart';

// büyük metinlerim
TextStyle metinStilleri(Color renkSec,String yaziFontu) {
  return TextStyle(
    color: renkSec,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: yaziFontu
  );
}

// Küçük metinlerim
TextStyle kucukMetinStilleri(Color renkSec,String yaziFontu) {
  return TextStyle(
    color: renkSec,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: yaziFontu
  );
}
