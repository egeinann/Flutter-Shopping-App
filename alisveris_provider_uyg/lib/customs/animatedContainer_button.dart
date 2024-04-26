import 'package:alisveris_provider_uyg/customs/renkler.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

Widget shortAnimatedContainer(bool isPressed, bool inset, Widget child) {
  return AnimatedContainer(
    height: 70,
    width: 70,
    duration: const Duration(milliseconds: 70),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: CustomRenkler.beyazRenk,
      boxShadow: [
        BoxShadow(
          blurRadius: isPressed ? 1 : 1,
          offset: -(isPressed ? const Offset(6, 6) : const Offset(6, 6)),
          color: CustomRenkler.beyazRenk,
          inset: inset,
        ),
        BoxShadow(
          blurRadius: isPressed ? 1 : 1,
          offset: isPressed ? const Offset(6, 6) : const Offset(6, 6),
          color: const Color.fromARGB(255, 141, 141, 141),
          inset: inset,
        ),
      ],
    ),
    child: child,
  );
}

Widget longAnimatedContainer(bool isPressed, bool inset, Widget child) {
  return AnimatedContainer(
      // bu animatedContainer farklı ve tek olduğu için method halinde değil :)
      height: 80,
      width: 300,
      duration: const Duration(milliseconds: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomRenkler.beyazRenk,
        boxShadow: [
          BoxShadow(
            blurRadius: isPressed ? 5 : 20.0,
            offset: -(isPressed
                ? const Offset(10, 10)
                : const Offset(10, 10)), // mesafe içe basıklık
            color: CustomRenkler.beyazRenk,
            inset: isPressed,
          ),
          BoxShadow(
            blurRadius: isPressed ? 5 : 20.0,
            offset: isPressed
                ? const Offset(10, 10)
                : const Offset(10, 10), // mesafe içe basıklık
            color: const Color.fromARGB(255, 166, 166, 166),
            inset: isPressed,
          ),
        ],
      ),
      child: child);
}
