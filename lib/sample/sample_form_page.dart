import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/form_widgets/text_input.dart';
import '../common/form_widgets/dropdown.dart';
import '../common/form_widgets/checkbox.dart';
import '../common/form_widgets/slider.dart';

// Form field controllers and providers
final nameControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final dropdownValueProvider = StateProvider<String?>((ref) => null);
final checkboxValueProvider = StateProvider<bool>((ref) => false);
final sliderValueProvider = StateProvider<double>((ref) => 50.0);

class SampleFormPage extends ConsumerWidget {
  const SampleFormPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nameControllerProvider);
    final dropdownValue = ref.watch(dropdownValueProvider);
    final checkboxValue = ref.watch(checkboxValueProvider);
    final sliderValue = ref.watch(sliderValueProvider);

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Builder Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Text Input
              CustomTextInput(
                label: "Name",
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Dropdown
              CustomDropdown<String>(
                label: "Select Country",
                value: dropdownValue,
                items: const [
                  DropdownMenuItem(value: "India", child: Text("India")),
                  DropdownMenuItem(value: "USA", child: Text("USA")),
                  DropdownMenuItem(value: "UK", child: Text("UK")),
                ],
                onChanged: (val) {
                  ref.read(dropdownValueProvider.notifier).state = val;
                },
              ),
              const SizedBox(height: 16),

              // Checkbox
              CustomCheckbox(
                value: checkboxValue,
                label: "I accept the terms and conditions",
                onChanged: (val) {
                  ref.read(checkboxValueProvider.notifier).state = val ?? false;
                },
              ),
              const SizedBox(height: 16),

              // Slider
              Text("Age: ${sliderValue.round()} years"),
              CustomSlider(
                value: sliderValue,
                min: 10,
                max: 100,
                divisions: 18,
                onChanged: (val) {
                  ref.read(sliderValueProvider.notifier).state = val;
                },
              ),
              const SizedBox(height: 32),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form submitted successfully!')),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
