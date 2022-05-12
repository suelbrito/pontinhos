import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pontinhos/components/imagem_resultado.dart';
import 'package:pontinhos/data/data.dart' as globals;
import 'package:pontinhos/models/area.dart';
import 'package:pontinhos/models/partida.dart';
import 'package:pontinhos/models/risco.dart';
import 'package:intl/intl.dart';

void jogar(id, context) {
  // Caso o jogo já tenha terminado
  if ((globals.pontosUsuario + globals.pontosRobot) == 49) {
    return;
  }

  bool encontrado = false;
  bool fezPonto = false;

  for (Risco item in globals.riscos) {
    if (item.id == id) {
      encontrado = true;
    }
  }

  if (!encontrado) {
    Risco risco = Risco(
        id: id,
        usuario: globals.jogadorAtual,
        color: (globals.jogadorAtual == globals.User.me
            ? Colors.blue
            : Colors.red));
    globals.riscos.add(risco);
    globals.jogadasRestantes.remove(id);

    if (kDebugMode) {
      print('Jogador: ${globals.jogadorAtual.name}');
      print('Risco jogado: $id');
      print('Itens restantes: ${globals.jogadasRestantes.length}');
      print('------------------------');
    }

    fezPonto = verificarPonto(id);

    // Atualizar jogador atual
    if (!fezPonto) {
      trocarJogadorAtual();

      if ((globals.jogadorAtual == globals.User.robot) &&
          ((globals.pontosUsuario + globals.pontosRobot) < 49)) {
        lancarJogadaRobot();
      }
    }
  }

  // Tela de resultados
  if ((globals.pontosUsuario + globals.pontosRobot) == 49) {
    exibirResultado(context);
    adicionarPartida();
  }
}

void exibirResultado(BuildContext _context) {
  showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const SizedBox(
            height: 400,
            width: 350,
            child: ImagemResultado(),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

void trocarJogadorAtual() {
  globals.jogadorAtual = (globals.jogadorAtual == globals.User.me
      ? globals.User.robot
      : globals.User.me);
}

lancarJogadaRobot() {
  bool fezPonto = false;

  // Analisar se tem 3 riscos pra fazer ponto
  globals.riscosAreas.forEach((quadrado, ids) {
    final index = globals.areas.indexWhere((element) => element.id == quadrado);

    if (index < 0) {
      int qtde = 0;
      for (String id in ids) {
        for (Risco item in globals.riscos) {
          if (item.id == id) {
            qtde++;
          }
        }
      }
      if (qtde == 3) {
        for (String id in ids) {
          final indexRisco =
              globals.riscos.indexWhere((element) => element.id == id);
          if (indexRisco < 0) {
            Risco risco = Risco(
                id: id,
                usuario: globals.jogadorAtual,
                color: (globals.jogadorAtual == globals.User.me
                    ? Colors.blue
                    : Colors.red));
            globals.riscos.add(risco);
            globals.jogadasRestantes.remove(id);

            if (kDebugMode) {
              print('Jogador: ${globals.jogadorAtual.name}');
              print('Risco jogado: $id');
              print('Itens restantes: ${globals.jogadasRestantes.length}');
              print('------------------------');
            }

            pintarArea(quadrado);
            fezPonto = true;
          }
        }
      }
    }
  });

  // Analisar se tem 4 riscos após alguma jogada e a casa não foi preenchida
  globals.riscosAreas.forEach((quadrado, ids) {
    final index = globals.areas.indexWhere((element) => element.id == quadrado);

    if (index < 0) {
      int qtde = 0;
      for (String id in ids) {
        for (Risco item in globals.riscos) {
          if (item.id == id) {
            qtde++;
          }
        }
      }
      if (qtde == 4) {
        pintarArea(quadrado);
        fezPonto = true;
      }
    }
  });
  if (fezPonto) {
    lancarJogadaRobot();
  } else {
    String riscoId = '';

    riscoId = sortearRisco();

    if (riscoId.isNotEmpty) {
      Risco risco = Risco(
          id: riscoId,
          usuario: globals.jogadorAtual,
          color: (globals.jogadorAtual == globals.User.me
              ? Colors.blue
              : Colors.red));
      globals.riscos.add(risco);
      globals.jogadasRestantes.remove(riscoId);

      if (kDebugMode) {
        print('Jogador: ${globals.jogadorAtual.name}');
        print('Risco sorteado: $riscoId');
        print('Itens restantes: ${globals.jogadasRestantes.length}');
        print('------------------------');
      }

      trocarJogadorAtual();
    }
  }
}

String sortearRisco() {
  String id = '';
  List<String> _jogadasRestantes = List<String>.from(globals.jogadasRestantes);
  List<Risco> _riscos = List<Risco>.from(globals.riscos);
  int size;
  bool jogadaArriscada = false;
  Random random;
  int index;

  do {
    jogadaArriscada = false;
    size = _jogadasRestantes.length;

    // Se não tiver opção, o Robot vai ter que fazer uma jogada aleatória mesmo
    if (size == 0) {
      if (globals.jogadasRestantes.isNotEmpty) {
        random = Random();
        index = random.nextInt(globals.jogadasRestantes.length);
        id = globals.jogadasRestantes[index];
      }
    } else {
      random = Random();
      index = random.nextInt(size);
      id = _jogadasRestantes[index];
      Risco _risco = Risco(id: id, usuario: globals.jogadorAtual);
      _riscos.add(_risco);

      // Verifica se a jogada dá ponto para o jogador
      globals.riscosAreas.forEach((quadrado, ids) {
        final index =
            globals.areas.indexWhere((element) => element.id == quadrado);

        if (index < 0) {
          int qtde = 0;
          for (String _id in ids) {
            for (Risco item in _riscos) {
              if (item.id == _id) {
                qtde++;
              }
            }
          }
          if (qtde == 3) {
            jogadaArriscada = true;
            _jogadasRestantes.remove(id);
            _riscos.remove(_risco);
          }
        }
      });
    }
  } while (size > 0 && jogadaArriscada && globals.jogadasRestantes.isNotEmpty);

  return id;
}

bool verificarPonto(id) {
  bool fezPonto = false;
  globals.riscosAreas.forEach((quadrado, ids) {
    final index = globals.areas.indexWhere((element) => element.id == quadrado);

    if (index < 0) {
      int qtde = 0;
      for (String id in ids) {
        for (Risco item in globals.riscos) {
          if (item.id == id) {
            qtde++;
          }
        }
        if (qtde == 4) {
          pintarArea(quadrado);
          fezPonto = true;
        }
      }
    }
  });

  return fezPonto;
}

void pintarArea(String quadrado) {
  Area area = Area(
      id: quadrado,
      jogador: globals.jogadorAtual,
      color: (globals.jogadorAtual == globals.User.me
          ? Colors.blue.shade300
          : Colors.red.shade300));
  globals.areas.add(area);

  globals.pontosUsuario = globals.pontosRobot = 0;
  for (Area item in globals.areas) {
    if (item.jogador == globals.User.me) {
      globals.pontosUsuario++;
    } else {
      globals.pontosRobot++;
    }
  }
}

Color getColor(id) {
  for (Risco item in globals.riscos) {
    if (item.id == id) {
      return item.color;
    }
  }

  return Colors.grey.shade300;
}

Color getAreaColor(id) {
  for (Area item in globals.areas) {
    if (item.id == id) {
      return item.color;
    }
  }

  return Colors.white;
}

reiniciar() {
  globals.jogadorAtual = globals.User.me;
  globals.pontosUsuario = 0;
  globals.pontosRobot = 0;
  globals.areas = [];
  globals.riscos = [];
  globals.jogadasRestantes = [
    "h11",
    "h12",
    "h13",
    "h14",
    "h15",
    "h16",
    "h17",
    "h21",
    "h22",
    "h23",
    "h24",
    "h25",
    "h26",
    "h27",
    "h31",
    "h32",
    "h33",
    "h34",
    "h35",
    "h36",
    "h37",
    "h41",
    "h42",
    "h43",
    "h44",
    "h45",
    "h46",
    "h47",
    "h51",
    "h52",
    "h53",
    "h54",
    "h55",
    "h56",
    "h57",
    "h61",
    "h62",
    "h63",
    "h64",
    "h65",
    "h66",
    "h67",
    "h71",
    "h72",
    "h73",
    "h74",
    "h75",
    "h76",
    "h77",
    "h81",
    "h82",
    "h83",
    "h84",
    "h85",
    "h86",
    "h87",
    "v11",
    "v12",
    "v13",
    "v14",
    "v15",
    "v16",
    "v17",
    "v18",
    "v21",
    "v22",
    "v23",
    "v24",
    "v25",
    "v26",
    "v27",
    "v28",
    "v31",
    "v32",
    "v33",
    "v34",
    "v35",
    "v36",
    "v37",
    "v38",
    "v41",
    "v42",
    "v43",
    "v44",
    "v45",
    "v46",
    "v47",
    "v48",
    "v51",
    "v52",
    "v53",
    "v54",
    "v55",
    "v56",
    "v57",
    "v58",
    "v61",
    "v62",
    "v63",
    "v64",
    "v65",
    "v66",
    "v67",
    "v68",
    "v71",
    "v72",
    "v73",
    "v74",
    "v75",
    "v76",
    "v77",
    "v78"
  ];
}

void adicionarPartida() {
  Partida partida = Partida(
      dataHora: DateTime.now(),
      pontosUsuario: globals.pontosUsuario,
      pontosRobot: globals.pontosRobot);

  globals.partidas.insert(0, partida);
}
