import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokiomarineapp/src/colors.dart';
import 'package:tokiomarineapp/src/login/login_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
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
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bem-vindo", style: TextStyle(color: Colors.white)),
              Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}
