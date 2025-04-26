
import 'package:flutter/material.dart';
import 'sample/sample_form_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Builder Kit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleFormPage(),
    );
  }
}
