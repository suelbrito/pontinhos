import 'package:flutter/material.dart';
import 'package:pontinhos/screens/game_screen.dart';
import 'package:pontinhos/screens/help_screen.dart';
import 'package:pontinhos/screens/matches_screen.dart';
import 'package:pontinhos/screens/tabs_screen.dart';
import 'package:pontinhos/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo dos pontinhos',
      theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.cyan,
                secondary: Colors.amber,
                tertiary: Colors.cyan.shade900,
                inversePrimary: Colors.white,
              ),
          fontFamily: 'RobotoCondensed',
          textTheme: ThemeData().textTheme.copyWith(
              headline1: const TextStyle(color: Colors.grey, fontSize: 25))),
      initialRoute: '/',
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.GAME: (ctx) => const GameScreen(),
        AppRoutes.HELP: (ctx) => const HelpScreen(),
        AppRoutes.MATCHES: (ctx) => const MatchesScreen(),
        //AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
      },
    );
  }
}
