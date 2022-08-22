import 'package:flutter/material.dart';
import 'package:recolt_app/assets/colors/design.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  const SlideDots(this.isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Color(int.parse("0xff$primaryCta")) : Color(int.parse("0xff$primaryCta")).withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}