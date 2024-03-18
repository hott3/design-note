import 'package:flutter/material.dart';

class ColorOption {
  const ColorOption({
    required this.label,
    required this.value,
  });

  final String label;
  final Color value;
}

class FloatingActionButtonLocationOption {
  const FloatingActionButtonLocationOption({
    required this.label,
    required this.value,
  });

  final String label;
  final FloatingActionButtonLocation value;
}
