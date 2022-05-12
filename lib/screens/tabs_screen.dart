import 'package:pontinhos/components/main_drawer.dart';
import 'package:pontinhos/screens/game_screen.dart';
import 'package:pontinhos/screens/help_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _indexSelectedScreen = 0;
  final List<String> _titles = ['Pontinhos', 'Ajuda'];

  // ignore: prefer_const_constructors
  final List<Widget> _screens = [GameScreen(), const HelpScreen()];

  _selectScreen(int index) {
    setState(() {
      _indexSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_indexSelectedScreen])),
      body: _screens[_indexSelectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor:
            Colors.blue.shade900, //Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _indexSelectedScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset), label: 'Jogar'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Ajuda'),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
