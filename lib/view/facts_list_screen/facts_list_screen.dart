import 'package:cat_facts_api_sample_integration/controller/facts_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FactsListScreen extends StatefulWidget {
  const FactsListScreen({super.key});

  @override
  State<FactsListScreen> createState() => _FactsListScreenState();
}

class _FactsListScreenState extends State<FactsListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<FactsListScreenController>().getFactsList();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FactsListScreenController>(
        builder: (context, factsListScreenControllerObj, child) =>
            ListView.builder(
          itemCount: factsListScreenControllerObj.factsList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Colors.yellow,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(factsListScreenControllerObj
                        .factsList[index].length
                        .toString()),
                  ),
                  title: Text(factsListScreenControllerObj.factsList[index].fact
                      .toString()),
                )),
          ),
        ),
      ),
    );
  }
}
