import 'package:cat_facts_api_sample_integration/controller/facts_screen_controller.dart';
import 'package:cat_facts_api_sample_integration/view/facts_list_screen/facts_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FactsListScreen(),
                    ));
              },
              icon: Icon(
                Icons.arrow_circle_right_sharp,
                size: 30,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FactsScreenController>().getFact();
        },
      ),
      body: Center(
        child: Consumer<FactsScreenController>(
          builder: (context, providerObj, child) => providerObj.isLoading
              ? CircularProgressIndicator()
              : Row(
                  children: [
                    Text(providerObj.resObj?.length.toString() ?? "no data"),
                    Expanded(
                      child: Text(
                        providerObj.resObj?.fact.toString() ?? "no data",
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
