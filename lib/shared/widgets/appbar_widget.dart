import 'package:flutter/material.dart';
import 'package:todolist/core/colors.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const AppbarWidget({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(50);


  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor:blueClr,
        leading: Icon(Icons.arrow_back_ios, color: white,),
        centerTitle: true,
        title: Text("To-Do List", 
        style: TextStyle(
          color:white, 
          fontWeight: FontWeight.bold),),
      );
  }
}



 

  
 