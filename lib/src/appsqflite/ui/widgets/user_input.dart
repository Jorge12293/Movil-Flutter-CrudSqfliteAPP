import 'package:appflutterpractice/src/appsqflite/models/todo_model.dart';
import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {

var textController = TextEditingController();
final Function insertFunction;
UserInput(
  {
  required this.insertFunction,
  Key? key
  }
) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      color: Colors.yellow.shade200,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(15)
              ),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'add new todo',
                  border: InputBorder.none
                ),
              ),
            )
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: (){
              var myTodo = Todo(
                title: textController.text, 
                creationDate: DateTime.now(), 
                isChecked: false
              );
              insertFunction(myTodo);
            },
            child: Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Text('Add',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),

    );
  }
}