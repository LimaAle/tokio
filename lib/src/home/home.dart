import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tokiomarineapp/src/colors.dart';
import 'package:tokiomarineapp/src/home/webview.dart';
import 'package:tokiomarineapp/src/home/widgets/cards.dart';
import 'package:tokiomarineapp/src/home/widgets/drawer.dart';
import 'package:tokiomarineapp/src/home/widgets/header.dart';
import 'package:tokiomarineapp/src/login/login_controller.dart';
import 'package:tokiomarineapp/src/model/user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserModel user;
  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users/1');
    final response = await http.get(url);
    setState(() {
      user = UserModel.fromJson(jsonDecode(response.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackgroundDark,
      appBar: AppBar(
        actions: [Icon(Icons.notifications_on_outlined)],
        centerTitle: true,
        title: Text("Tokio Marine"),
        backgroundColor: colorBackgroundDark,
      ),
      drawer: DrawerCustom(
        name: user.name ?? "nome",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              name: user.name ?? "nome",
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cotar e Contratar",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            String url =
                                'https://www.tokiomarine.com.br/cotacao-auto/';
                            if (GetPlatform.isWeb) {
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(
                                  Uri.parse(url),
                                );
                              }
                            } else {
                              Get.to(() => InAppWebview());
                            }
                          },
                          child: const HomeCards(
                            text: "Automóvel",
                            icon: Icons.car_crash,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const HomeCards(
                          text: "Residência",
                          icon: FontAwesomeIcons.house,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const HomeCards(
                          text: "Vida",
                          icon: FontAwesomeIcons.heartPulse,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const HomeCards(
                          text: "Acidentes Pessoais",
                          icon: FontAwesomeIcons.heartCrack,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const HomeCards(
                          text: "Moto",
                          icon: FontAwesomeIcons.motorcycle,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const HomeCards(
                          text: "Empresa",
                          icon: FontAwesomeIcons.building,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Minha Familia",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: colorBackgroundCard,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.circlePlus,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Adicione aqui membros da sua familia e compartilhe os seguros com eles.",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Contratados",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: colorBackgroundCard,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.faceFrown,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Você ainda não possui seguros contratados.",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
