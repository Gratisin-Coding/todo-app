import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vr_todo/screens/add_page.dart';
import 'package:vr_todo/services/db_service.dart';
import 'package:vr_todo/widgets/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> recordsList = [];

  void getRecords() async {
    Database db = await DbService.createDb();
    recordsList = await DbService.getRecords(db);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getRecords();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do App"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: recordsList.length,
        itemBuilder: (context, index) {
          Map currentRecord = recordsList[index];

          return ItemCard(
            itemKey: ValueKey(index),
            record: currentRecord,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddPage(),
            ),
          ).then((value) {
            setState(() {
              getRecords();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
