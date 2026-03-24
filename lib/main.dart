import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/controller/todoprovider.dart';
import 'package:todolist/app/view/todoscreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child:  MyApp(),
  
  ));
}

class MyApp extends StatelessWidget {
 
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}
