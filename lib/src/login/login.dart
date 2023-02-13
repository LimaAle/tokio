import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:tokiomarineapp/src/colors.dart';
import 'package:tokiomarineapp/src/login/login_controller.dart';
import 'package:tokiomarineapp/src/login/widgets/loginbackground.dart';
import 'package:tokiomarineapp/src/login/widgets/loginbutton.dart';
import 'package:tokiomarineapp/src/provider/google_signin.dart';
import 'package:tokiomarineapp/src/widgets/Textfield.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(
        mask: '###.###.###-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    final LoginController controller = Get.put(LoginController());
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
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                bottom: 2, // Space between underline and text
                              ),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: colorPrimary,
                                width: 2.0, // Underline thickness
                              ))),
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                    color: colorPrimary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
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
                        Obx(() => LoginTextfield(
                              controller: controller.cpfController.value,
                              mask: maskFormatter,
                              label: "CPF",
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(() => LoginTextfield(
                              controller: controller.passwordController.value,
                              obscure: true,
                              label: "Senha",
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(() => Checkbox(
                                value: controller.isChecked.value,
                                shape: const CircleBorder(),
                                fillColor: MaterialStateProperty.resolveWith(
                                    (Set<MaterialState> states) {
                                  return colorPrimary;
                                }),
                                onChanged: (value) =>
                                    controller.handleRememberMe(value!))),
                            const Text("Lembrar Sempre",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            const Text(
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
                        onClick: () => controller.login(),
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
                        if (GetPlatform.isWeb) return;
                        provider.signInWithGoogleWeb();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                      size: 32,
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
