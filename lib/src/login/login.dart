import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:tokiomarineapp/src/colors.dart';
import 'package:tokiomarineapp/src/login/widgets/loginbackground.dart';
import 'package:tokiomarineapp/src/login/widgets/loginbutton.dart';
import 'package:tokiomarineapp/src/provider/google_signin.dart';
import 'package:tokiomarineapp/src/widgets/Textfield.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var maskFormatter = new MaskTextInputFormatter(
        mask: '###.###.###-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    return Scaffold(
      body: BackgroundLogin(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: const [
                  Text(
                    "Bem vindo!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Aqui você gerencia seus seguros e de seus familiares em poucos cliques!",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 280,
                    constraints: const BoxConstraints(maxWidth: 350),
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 3))
                        ],
                        color: colorBackgroundCard,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Entrar",
                                style: TextStyle(
                                    color: colorPrimary,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Cadastrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        LoginTextfield(
                          mask: maskFormatter,
                          label: "CPF",
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const LoginTextfield(
                          obscure: true,
                          label: "Senha",
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("Lembrar Sempre",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                  color: colorPrimary,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: -35,
                      child: LoginButton(
                        onClick: () => {},
                      ))
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  "Acesse através das redes sociais",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (kIsWeb) return;
                        provider.signInWithGoogleWeb();
                        print("test");
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                      size: 32,
                    ),
                    IconButton(
                      onPressed: () {
                        provider.googleLogout();
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
