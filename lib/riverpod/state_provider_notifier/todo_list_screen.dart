import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/riverpod/state_provider_notifier/add_todo_screen.dart';
import 'package:riverpod_files/riverpod/state_provider_notifier/todo_model.dart';
import 'package:riverpod_files/riverpod/state_provider_notifier/todo_notifier.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoModel> todos = ref.watch(todoNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList"),
        actions: [],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height / 1.1,
            maxWidth: MediaQuery.sizeOf(context).width),
        child: (todos.isEmpty == true)
            ? const Center(
                child: Text("No todos"),
              )
            : ListView(
                children: [
                  for (final todo in todos)
                    CheckboxListTile(
                      value: todo.isCompleted,
                      onChanged: (value) {
                        ref.read(todoNotifierProvider.notifier).toggle(todo.id);
                      },
                      title: Text(todo.descp),
                    )
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 206, 151, 169),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateTodo()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
