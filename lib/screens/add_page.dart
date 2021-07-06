import 'package:flutter/material.dart';
import 'package:vr_todo/widgets/custom_button.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
              onTap: () {
                // TODO: Implement save data here
              },
            ),
          ],
        ),
      ),
    );
  }
}
