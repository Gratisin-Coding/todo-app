import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vr_todo/services/db_service.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.itemKey,
    required this.record,
  }) : super(key: key);

  final ValueKey itemKey;
  final Map record;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: itemKey,
      child: ListTile(
        title: Text(record['title']),
        subtitle: Text(record['description']),
      ),
      background: Container(
        padding: const EdgeInsets.only(left: 16.0),
        color: Colors.red,
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsets.only(right: 16.0),
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
      onDismissed: (dismissDirection) async {
        Database db = await DbService.createDb();
        DbService.deleteRecord(db, record['id']);

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Record has been successfully deleted")));
      },
    );
  }
}
