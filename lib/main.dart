import 'package:cat_facts_api_sample_integration/controller/facts_screen_controller.dart';
import 'package:cat_facts_api_sample_integration/view/facts_screen/facts_scree.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FactsScreenController(),
        )
      ],
      child: MaterialApp(
        home: FactsScreen(),
      ),
    );
  }
}
