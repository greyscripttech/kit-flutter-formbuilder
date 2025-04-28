<<<<<<< Updated upstream

import 'package:flutter/material.dart';
import 'sample/sample_form_page.dart';
=======
import 'package:flutter/material.dart';
// import 'sample/sample_form_page.dart'; 
import 'sample/sample_step_wizard_page.dart'; // Use Step Wizard Page
>>>>>>> Stashed changes

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Builder Kit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< Updated upstream
      home: const SampleFormPage(),
=======
      home: const SampleStepWizardPage(), // Set Step Wizard as Home
>>>>>>> Stashed changes
    );
  }
}
