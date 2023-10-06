import 'package:flutter/material.dart';
import 'package:flutter_application_1/list_provider.dart';
import 'package:flutter_application_1/second.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: ((context, numberListProviderModel, child) => Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                numberListProviderModel.add();
              },
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              title: const Center(child: Text("provider consumer")),
            ),
            body: SizedBox(
              child: Column(children: [
                Text(numberListProviderModel.numbers.last.toString()),
                Expanded(
                  child: ListView.builder(
                      itemCount: numberListProviderModel.numbers.length,
                      itemBuilder: (context, index) {
                        return Text(
                            numberListProviderModel.numbers[index].toString());
                      }),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Second()));
                    },
                    child: const Text('Second'))
              ]),
            ),
          )),
    );
  }
}
