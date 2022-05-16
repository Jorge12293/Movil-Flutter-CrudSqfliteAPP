import 'package:appflutterpractice/src/appsqflite/data/todo_db.dart';
import 'package:appflutterpractice/src/appsqflite/ui/widgets/todo_card.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  var db = DatabaseConnect();
  final Function insertFunction;
  final Function deleteFunction;
  TodoList(
    {
      required this.insertFunction,
      required this.deleteFunction,
      Key? key
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData:const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          var data = snapshot.data;
          var datalength = data!.length;

          return data.length == 0
           ? Center(child: Text('Data not found'))
           :ListView.builder(
             itemCount: datalength,
             itemBuilder: (context,i)=>TodoCard(
               id: data[i].id, 
               title: data[i].title, 
               creationDate: data[i].creationDate, 
               isChecked: data[i].isChecked, 
               insertFunction: insertFunction, 
               deleteFunction: deleteFunction
              )
            );
        }
      ),
    );
  }
}