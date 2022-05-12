import 'package:flutter/material.dart';
import 'package:pontinhos/data/data.dart';
import 'package:pontinhos/models/area.dart';
import 'package:pontinhos/models/risco.dart';
import 'package:pontinhos/utils/app_routes.dart';
import 'package:pontinhos/data/data.dart' as globals;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? _corUsuario = globals.indexCorUsuario;
  int? _corRobot = globals.indexCorRobot;

  mudarCor(User usuario, value) {
    setState(() {
      if (usuario == User.me) {
        _corUsuario = value;
        globals.indexCorUsuario = value;
      } else {
        _corRobot = value;
        globals.indexCorRobot = value;
      }
      atualizarCores();
    });
  }

  atualizarCores() {
    int index = 0;
    for (Risco item in globals.riscos) {
      Risco novo = Risco(
          id: item.id,
          usuario: item.usuario,
          color: globals.cores[(item.usuario == User.me)
              ? globals.indexCorUsuario
              : globals.indexCorRobot]);
      index = globals.riscos.indexOf(item);
      globals.riscos[index] = novo;
    }

    for (Area item in globals.areas) {
      Area novo = Area(
          id: item.id,
          jogador: item.jogador,
          color: globals.coresLight[(item.jogador == User.me)
              ? globals.indexCorUsuario
              : globals.indexCorRobot]);
      index = globals.areas.indexOf(item);
      globals.areas[index] = novo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Align(
                      child: Text(
                        'Defina suas preferências',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      alignment: FractionalOffset.topLeft,
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      child: Text('Sua cor', style: TextStyle(fontSize: 16.0)),
                      alignment: FractionalOffset.topLeft,
                    ),
                    // Blue
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color:
                              (_corRobot == 0) ? Colors.grey : globals.cores[0],
                        ),
                      ),
                      value: 0,
                      groupValue: _corUsuario,
                      onChanged: (_corRobot == 0)
                          ? null
                          : (int? value) {
                              mudarCor(User.me, value);
                            },
                    ),
                    // Red
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color:
                              (_corRobot == 1) ? Colors.grey : globals.cores[1],
                        ),
                      ),
                      value: 1,
                      groupValue: _corUsuario,
                      onChanged: (_corRobot == 1)
                          ? null
                          : (int? value) {
                              mudarCor(User.me, value);
                            },
                    ),
                    // Amber
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color:
                              (_corRobot == 2) ? Colors.grey : globals.cores[2],
                        ),
                      ),
                      value: 2,
                      groupValue: _corUsuario,
                      onChanged: (_corRobot == 2)
                          ? null
                          : (int? value) {
                              mudarCor(User.me, value);
                            },
                    ),
                    // Purple
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color:
                              (_corRobot == 3) ? Colors.grey : globals.cores[3],
                        ),
                      ),
                      value: 3,
                      groupValue: _corUsuario,
                      onChanged: (_corRobot == 3)
                          ? null
                          : (int? value) {
                              mudarCor(User.me, value);
                            },
                    ),
                    // Pink
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color:
                              (_corRobot == 4) ? Colors.grey : globals.cores[4],
                        ),
                      ),
                      value: 4,
                      groupValue: _corUsuario,
                      onChanged: (_corRobot == 4)
                          ? null
                          : (int? value) {
                              mudarCor(User.me, value);
                            },
                    ),
                    const SizedBox(height: 50),
                    const Align(
                      child: Text('Cor do Robot',
                          style: TextStyle(fontSize: 16.0)),
                      alignment: FractionalOffset.bottomLeft,
                    ),
                    // Blue
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color: (_corUsuario == 0)
                              ? Colors.grey
                              : globals.cores[0],
                        ),
                      ),
                      value: 0,
                      groupValue: _corRobot,
                      onChanged: (_corUsuario == 0)
                          ? null
                          : (int? value) {
                              mudarCor(User.robot, value);
                            },
                    ),
                    // Red
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color: (_corUsuario == 1)
                              ? Colors.grey
                              : globals.cores[1],
                        ),
                      ),
                      value: 1,
                      groupValue: _corRobot,
                      onChanged: (_corUsuario == 1)
                          ? null
                          : (int? value) {
                              mudarCor(User.robot, value);
                            },
                    ),
                    // Amber
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color: (_corUsuario == 2)
                              ? Colors.grey
                              : globals.cores[2],
                        ),
                      ),
                      value: 2,
                      groupValue: _corRobot,
                      onChanged: (_corUsuario == 2)
                          ? null
                          : (int? value) {
                              mudarCor(User.robot, value);
                            },
                    ),
                    // Purple
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color: (_corUsuario == 3)
                              ? Colors.grey
                              : globals.cores[3],
                        ),
                      ),
                      value: 3,
                      groupValue: _corRobot,
                      onChanged: (_corUsuario == 3)
                          ? null
                          : (int? value) {
                              mudarCor(User.robot, value);
                            },
                    ),
                    // Pink
                    RadioListTile<int>(
                      title: SizedBox(
                        height: 20,
                        child: Container(
                          color: (_corUsuario == 4)
                              ? Colors.grey
                              : globals.cores[4],
                        ),
                      ),
                      value: 4,
                      groupValue: _corRobot,
                      onChanged: (_corUsuario == 4)
                          ? null
                          : (int? value) {
                              mudarCor(User.robot, value);
                            },
                    ),
                  ],
                ),
              )),
        ));
  }
}
