import 'package:cat_facts_api_sample_integration/controller/facts_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FactsScreenController>().getFact();
        },
      ),
      body: Column(),
    );
  }
}
