import 'package:flutter/material.dart';
import 'package:pontinhos/data/data.dart';

class Area {
  final String id;
  final User jogador;
  final Color color;

  Area({
    required this.id,
    required this.jogador,
    this.color = Colors.white,
  });
}
