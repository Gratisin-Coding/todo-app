import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.itemKey}) : super(key: key);

  final ValueKey itemKey;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: itemKey,
      child: ListTile(
        title: Text("Ini Title"),
        subtitle: Text("Ini Subtitle"),
      ),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        // TODO: Implement onDismissed
      },
    );
  }
}
