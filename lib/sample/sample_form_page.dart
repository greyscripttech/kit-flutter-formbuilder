
import 'package:flutter/material.dart';
import '../common/form_widgets/text_input.dart';
import '../common/form_widgets/dropdown.dart';
import '../common/form_widgets/checkbox.dart';
import '../common/form_widgets/slider.dart';
import '../common/form_widgets/step_wizard.dart';

class SampleFormPage extends StatelessWidget {
  const SampleFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Builder Sample')),
      body: const Center(child: Text("Add integration logic here")),
    );
  }
}
