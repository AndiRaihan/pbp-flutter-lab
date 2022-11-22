import 'package:counter_7/main.dart';
import 'package:counter_7/model/myWatchListModel.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/widget/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MyDetailPage extends StatefulWidget {
  const MyDetailPage({super.key, required this.modelWatchList});
  final MyWatchListModel modelWatchList;

  @override
  State<MyDetailPage> createState() => _MyDetailPageState(modelWatchList);
}

class _MyDetailPageState extends State<MyDetailPage> {
  MyWatchListModel model;
  _MyDetailPageState(this.model);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ), // Menambahkan drawer menu
      drawer: const NavBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                model.fields.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 4, left: 8, right: 8, bottom: 4),
            child: Row(
              children: [
                const Text(
                  "Release Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  DateFormat.yMMMd().format(model.fields.releaseDate),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 4, left: 8, right: 8, bottom: 4),
            child: Row(
              children: [
                const Text(
                  "Rating: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '${model.fields.rating} / 5',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
    top: 4, left: 8, right: 8, bottom: 4),
            child: Row(
              children: [
                const Text(
                  "Status: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  model.fields.watched ? "Watched" : "Not Watched",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 4, left: 8, right: 8, bottom: 4),
            child: Row(
              children: [
                const Text(
                  "Review: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Flexible(
                  child: Text(
                    model.fields.review,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          const Flexible(fit: FlexFit.tight, child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(
                top: 8, left: 8, right: 8, bottom: 8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(40.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
