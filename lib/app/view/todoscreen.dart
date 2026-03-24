import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/controller/todoprovider.dart';
import 'package:todolist/core/colors.dart';
import 'package:todolist/shared/widgets/appbar_widget.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar:AppbarWidget(title: "To-Do List"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Enter task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  backgroundColor: blueClr,
                  shape: CircleBorder(),
                  onPressed: () {
                    provider.addTask(controller.text);
                    controller.clear();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),

          if (provider.pendingTasks.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Pending Tasks",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),

          Expanded(
            child: ListView(
              children: [

                ...provider.pendingTasks.map((task) {
                  int index = provider.tasks.indexOf(task);

                  return ListTile(
                    leading: Checkbox(
                      value: task.isDone,
                      onChanged: (_) {
                        provider.toggleTask(index);
                      },
                    ),
                    title: Text(task.title),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        provider.deleteTask(index);
                      },
                    ),
                  );
                }),

           
                if (provider.completedTasks.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("Completed Tasks",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),

      
                ...provider.completedTasks.map((task) {
                  int index = provider.tasks.indexOf(task);

                  return ListTile(
                    leading: Checkbox(
                      value: task.isDone,
                      onChanged: (_) {
                        provider.toggleTask(index);
                      },
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}