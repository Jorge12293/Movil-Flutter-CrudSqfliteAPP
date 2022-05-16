import 'package:appflutterpractice/src/appsqflite/data/todo_db.dart';
import 'package:appflutterpractice/src/appsqflite/models/todo_model.dart';
import 'package:appflutterpractice/src/appsqflite/ui/widgets/todo_card.dart';
import 'package:appflutterpractice/src/appsqflite/ui/widgets/todo_list.dart';
import 'package:appflutterpractice/src/appsqflite/ui/widgets/user_input.dart';
import 'package:flutter/material.dart';

class HomeTodoPage extends StatefulWidget {
  HomeTodoPage({Key? key}) : super(key: key);

  @override
  State<HomeTodoPage> createState() => _HomeTodoPageState();
}

class _HomeTodoPageState extends State<HomeTodoPage> {

  var db = DatabaseConnect();
  
  void addItem(Todo todo) async{
    await db.insertTodo(todo);
    setState(() {});
  } 
  void deleteItem(Todo todo) async{
    await db.deleteTodo(todo);
    setState(() {});
  } 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Todo App.'),
      ),
      body: Column(
        children: [
          TodoList(insertFunction: addItem,deleteFunction: deleteItem),
         // TodoCard(),
          UserInput(insertFunction: addItem)
        ],
      ),
    );
  }
}