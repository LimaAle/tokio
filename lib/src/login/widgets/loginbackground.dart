import 'package:flutter/material.dart';
import 'package:tokiomarineapp/src/colors.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: <Color>[
                      colorPrimary,
                      colorYellow,
                    ],
                    tileMode: TileMode.clamp,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                color: colorBackgroundDark,
              ),
            ),
          ],
        ),
        child
      ],
    );
  }
}
