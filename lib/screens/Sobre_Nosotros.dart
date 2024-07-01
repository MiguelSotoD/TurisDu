import 'package:flutter/material.dart';

class SobreNosotrosScreen extends StatelessWidget {
  const SobreNosotrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
        ),
        body: const Center(
          child: Text('SobreNosotrosScreen'),
        ));
  }
}
