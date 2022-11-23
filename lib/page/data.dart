import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/widget/NavBar.dart';
import 'package:flutter/material.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ), // Menambahkan drawer menu
      drawer: const NavBar(),
      body: Center(
        child: ListView.builder(
            itemCount: Budget.budgets.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text Judul
                    Container(
                      padding: const EdgeInsets.only(
                          top: 8, left: 15, right: 15, bottom: 8),
                      child: Text(
                        Budget.budgets[index].judul,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 8, left: 15, right: 15, bottom: 8),
                          child: Text(
                            Budget.budgets[index].nominal.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Flexible(fit: FlexFit.tight, child: SizedBox()),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 8, left: 15, right: 15, bottom: 8),
                          child: Text(
                            Budget.budgets[index].jenis,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
