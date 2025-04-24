
import 'package:flutter/material.dart';

class StepWizard extends StatelessWidget {
  final int currentStep;
  final List<Step> steps;
  final void Function(int) onStepTapped;
  final void Function() onStepContinue;
  final void Function() onStepCancel;

  const StepWizard({
    super.key,
    required this.currentStep,
    required this.steps,
    required this.onStepTapped,
    required this.onStepContinue,
    required this.onStepCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: currentStep,
      steps: steps,
      onStepTapped: onStepTapped,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
    );
  }
}
