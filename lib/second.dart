import 'package:flutter/material.dart';
import 'package:flutter_application_1/list_provider.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: ((context, numberListProviderModel, child) => Scaffold(
            appBar: AppBar(
              title: const Center(child: Text("provider consumer")),
            ),
            body: SizedBox(
              child: Column(children: [
                Text(numberListProviderModel.numbers.last.toString()),
                SizedBox(
                  height: 200,
                  width: double.maxFinite,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: numberListProviderModel.numbers.length,
                      itemBuilder: (context, index) {
                        return Text(
                            numberListProviderModel.numbers[index].toString());
                      }),
                )
              ]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                numberListProviderModel.add();
              },
              child: const Icon(Icons.add),
            ),
          )),
    );
  }
}
