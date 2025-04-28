import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/form_widgets/text_input.dart';
import '../common/form_widgets/dropdown.dart';
import '../common/form_widgets/checkbox.dart';
import '../common/form_widgets/slider.dart';
import '../common/form_widgets/step_wizard.dart';
import '../common/form_widgets/form_providers.dart';


// Reuse existing providers
final stepIndexProvider = StateProvider<int>((ref) => 0);

class SampleStepWizardPage extends ConsumerWidget {
  const SampleStepWizardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nameControllerProvider);
    final dropdownValue = ref.watch(dropdownValueProvider);
    final checkboxValue = ref.watch(checkboxValueProvider);
    final sliderValue = ref.watch(sliderValueProvider);
    final currentStep = ref.watch(stepIndexProvider);

    final _formKey = GlobalKey<FormState>();

    List<Step> steps = [
      Step(
        title: const Text('Name'),
        content: CustomTextInput(
          label: "Enter your Name",
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your name";
            }
            return null;
          },
        ),
        isActive: currentStep >= 0,
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: const Text('Country'),
        content: CustomDropdown<String>(
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
        isActive: currentStep >= 1,
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: const Text('Accept Terms'),
        content: CustomCheckbox(
          value: checkboxValue,
          label: "I accept the terms and conditions",
          onChanged: (val) {
            ref.read(checkboxValueProvider.notifier).state = val ?? false;
          },
        ),
        isActive: currentStep >= 2,
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: const Text('Confirm Age'),
        content: Column(
          children: [
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
          ],
        ),
        isActive: currentStep >= 3,
        state: currentStep == 3 ? StepState.indexed : StepState.indexed,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Step Wizard Sample')),
      body: Form(
        key: _formKey,
        child: StepWizard(
          currentStep: currentStep,
          steps: steps,
          onStepTapped: (index) {
            ref.read(stepIndexProvider.notifier).state = index;
          },
          onStepContinue: () {
            if (currentStep == 0 && !_formKey.currentState!.validate()) return;
            if (currentStep == 1 && dropdownValue == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select a country')),
              );
              return;
            }
            if (currentStep == 2 && !checkboxValue) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please accept the terms')),
              );
              return;
            }
            if (currentStep < 3) {
              ref.read(stepIndexProvider.notifier).state++;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Form submitted successfully!')),
              );
            }
          },
          onStepCancel: () {
            if (currentStep > 0) {
              ref.read(stepIndexProvider.notifier).state--;
            }
          },
        ),
      ),
    );
  }
}
