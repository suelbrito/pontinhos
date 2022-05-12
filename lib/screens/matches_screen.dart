import 'package:flutter/material.dart';
import 'package:pontinhos/components/partidas.dart';
import 'package:pontinhos/utils/app_routes.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partidas'),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Partidas(),
            ),
          )),
    );
  }
}
