import 'package:flutter/material.dart';
import 'package:pontinhos/data/data.dart';

class Risco {
  final String id;
  final Color color;
  final User usuario;

  Risco({
    required this.id,
    required this.usuario,
    this.color = Colors.white70,
  });
}
