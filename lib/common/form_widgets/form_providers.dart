import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Text Controller Provider
final nameControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

// Dropdown value Provider
final dropdownValueProvider = StateProvider<String?>((ref) => null);

// Checkbox Provider
final checkboxValueProvider = StateProvider<bool>((ref) => false);

// Slider Provider
final sliderValueProvider = StateProvider<double>((ref) => 50.0);
