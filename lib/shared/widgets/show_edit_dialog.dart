import 'package:flutter/material.dart';
import 'package:todolist/app/controller/todoprovider.dart';

void showEditDialog(BuildContext context, TodoProvider provider, int index, String oldTitle) {
    final TextEditingController editController =
        TextEditingController(text: oldTitle);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Edit Task"),
          content: TextField(
            controller: editController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                provider.editTask(index, editController.text);
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }