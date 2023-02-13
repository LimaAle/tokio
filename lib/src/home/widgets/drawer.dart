import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tokiomarineapp/src/colors.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorBackgroundDark,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Olá!",
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        children: const [
                          Text(
                            "Minha conta",
                            style: TextStyle(color: colorPrimary),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ]),
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title: const Text(
              'Home/Seguro',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title: const Text('Minhas Contratações',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title: const Text('Meus Sinistros',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title: const Text('Minha Familia',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title:
                const Text('Meus Bens', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title:
                const Text('Pagamentos', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title:
                const Text('Corretores', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title: const Text('Validar Boleto',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title: const Text('Telefones Importantes',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          ListTile(
            leading: const Icon(
              Icons.forward,
              size: 24,
              color: colorPrimary,
            ),
            title: const Text('Configurações',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(
            color: colorBackgroundCard,
          ),
          TextButton(
            onPressed: () async {
              await GoogleSignIn().signOut();
              Get.toNamed("/login");
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Sair", style: TextStyle(color: colorPrimary)),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                colorPrimary,
                colorYellow,
              ],
              tileMode: TileMode.clamp,
            )),
            child: Column(children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Text(
                "Dúvidas?",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: 200,
                child: Text(
                  "Converse agora mesmo com a mariane e tire suas dúvidas",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
