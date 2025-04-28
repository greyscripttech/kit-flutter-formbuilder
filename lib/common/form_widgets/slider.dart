import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final void Function(double) onChanged;
  final double min;
  final double max;
  final int divisions;

  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.divisions = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      label: value.round().toString(),
    );
  }
}
