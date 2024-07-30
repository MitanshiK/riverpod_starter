import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:riverpod_files/riverpod/state_provider_notifier/todo_model.dart';
import 'package:riverpod_files/riverpod/state_provider_notifier/todo_notifier.dart';

class CreateTodo extends ConsumerWidget {
  const CreateTodo({super.key});

  @override
  Widget build(BuildContext context ,WidgetRef ref) {

     List<TodoModel> todos= ref.watch(todoNotifierProvider);
     TextEditingController idController=TextEditingController();
     TextEditingController descpController=TextEditingController();
     bool ischecked=false;

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Create todo"),
        actions: [
        TextButton(
        onPressed: (){
          TodoModel newTodo= TodoModel(id: idController.text, descp: descpController.text, isCompleted: false);
          ref.read(todoNotifierProvider.notifier).addTodo(newTodo);
          Navigator.pop(context);
         }
        ,child: const Text("Save"))
        ],),
        body: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight:MediaQuery.sizeOf(context).height/1.1,
            maxWidth: MediaQuery.sizeOf(context).width),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   const Text("Todo Id"),
                   SizedBox(
                    width: 150,
                     child: TextField(
                    decoration: InputDecoration(hintText: "Id",
                     hintStyle: TextStyle(color: Colors.grey) ),
                      maxLines: 1,
                     controller: idController,
                     ),
                   ) 
              ],),
              const SizedBox(height: 15,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   const Text("Description "),
                   SizedBox(
                    width: 150,
                     child: TextField(
                      decoration: const InputDecoration(
                        hintText: "description",
                        hintStyle: TextStyle(color: Colors.grey)
                        ),
                       maxLines: null,
                     controller: descpController,
                     ),
                   ) 
              ],)
          ],),
        ),
    );
  }
}