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
        primarySwatch: Colors.blue,
      ),
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
