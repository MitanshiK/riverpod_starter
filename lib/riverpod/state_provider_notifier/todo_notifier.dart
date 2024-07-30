import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/riverpod/state_provider_notifier/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>>{
   TodoNotifier(): super([]);

void addTodo(TodoModel todo){
  state=[...state,todo];
}

void removeTodo(String todoId){
  state=[
    for(final todo in state)
      if(todo.id != todoId)
       todo
  ];
}
 void toggle(String todoId) {
    state = [
      for (final todo in state)
      
        if (todo.id == todoId)
      
          todo.copyTodo(todo.id,todo.descp,!todo.isCompleted)
        else
          todo,
    ];
  }
    
// }
}

final todoNotifierProvider=StateNotifierProvider<TodoNotifier,List<TodoModel>>((ref){
 return TodoNotifier();
});