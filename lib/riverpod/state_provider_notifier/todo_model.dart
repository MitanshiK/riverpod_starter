
class TodoModel{

   TodoModel({ required this.id,required this.descp,required this.isCompleted});
 final String id;
 final String descp;
 final bool isCompleted;
 
 TodoModel copyTodo(String? id,String? descp ,bool? isCompleted){

  return TodoModel(id: id ?? this.id,
                   descp: descp ?? this.descp,
                   isCompleted: isCompleted ?? this.isCompleted);
 }
}