import 'package:get/get.dart';
import 'package:tokiomarineapp/src/home/home.dart';
import 'package:tokiomarineapp/src/login/login.dart';

class Routes {
  static String home = "/";
  static String login = "/login";

  static String getHomeRoute() => home;
  static String getLoginRoute() => login;
  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => const LoginScreen()),
  ];
}
