import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tokiomarineapp/routes.dart';
import 'package:tokiomarineapp/src/login/login.dart';
import 'package:tokiomarineapp/src/provider/google_signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "tokioproject",
      options: const FirebaseOptions(
          apiKey: "AIzaSyCfthQtWfX-U0oZNHouL1cwXngUJrsHPrY",
          projectId: "tokiomarine-b8f56",
          messagingSenderId: "729982233494",
          appId: "1:729982233494:web:ee067317fffa17f72f0bb7"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Tokio Marine',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.getLoginRoute(),
        getPages: Routes.routes,
      ),
    );
  }
}
