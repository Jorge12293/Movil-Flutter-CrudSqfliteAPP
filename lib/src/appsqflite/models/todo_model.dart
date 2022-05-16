class Todo{

  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  Todo({
    this.id,
    required this.title,
    required this.creationDate,
    required this.isChecked,
  });

  // To save this data in database we need to convert it to a map
  // Let is create function fot that
  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'title':title,
      'creationDate':creationDate.toString(), // sqlflite database doesn't support the datetime type so we will save text
      'isChecked': isChecked ? 1 : 0, // Save integer
    };
  }
  
  // This function is for debbugging only

  @override
  String toString() {
    return 'Todo(id:$id, title:$title, creationDate:$creationDate, ischecked:$isChecked)';
  }


}