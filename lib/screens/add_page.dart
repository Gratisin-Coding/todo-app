import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vr_todo/services/db_service.dart';
import 'package:vr_todo/widgets/custom_button.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void deleteTextfieldData(BuildContext context) {
    _titleController.clear();
    _descriptionController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Item successfully saved")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add To-Do"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: "Description"),
            ),
            SizedBox(
              height: 32.0,
            ),
            CustomButton(
              onTap: () async {
                // Save data here

                String title = _titleController.text;
                String description = _descriptionController.text;

                if (title.isEmpty || description.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Title and description can't be empty")));
                } else {
                  Database db = await DbService.createDb();

                  DbService.createRecord(db, title, description);

                  deleteTextfieldData(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
