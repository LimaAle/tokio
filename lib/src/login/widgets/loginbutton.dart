import 'package:flutter/material.dart';
import 'package:tokiomarineapp/src/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onClick});
  final Function() onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3))
        ], color: colorBackgroundCard, borderRadius: BorderRadius.circular(40)),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  colorPrimary,
                  colorYellow,
                ],
                tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(30)),
          child: const Icon(
            Icons.arrow_forward_rounded,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
