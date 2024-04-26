import 'package:flutter/material.dart';

class CustomRenkler {
  static const Color siyahRenk = Color.fromARGB(255, 0, 0, 0);
  static const Color maviGriRenk = Color.fromARGB(255, 43, 60, 68);
  static const Color beyazRenk = Color.fromARGB(255, 255, 255, 255);
  static const Color griRenk = Color.fromARGB(255, 89, 89, 89);
}

Widget renkliContainer() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        colors: [
          CustomRenkler.beyazRenk,
          CustomRenkler.maviGriRenk,
        ],
      ),
    ),
  );
}
