import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:riverpod_files/GetX/simple_state_management/simple_controller.dart';

class InfoScreen2 extends StatelessWidget {
  const InfoScreen2({super.key});

  @override
  Widget build(BuildContext context) {
  //  final simpleController = Get.find<SimpleController>();
  final SimpleController simpleController = Get.put(SimpleController());



    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar( 
        title: Text("getx (simple state management)"),
         backgroundColor: Colors.white,
         ),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
                   // name
        ListTile(  
          onTap: (){
      
           showDialog(
            context: context, 
            builder: (BuildContext context) {
              return  AlertDialog(
        title:const Text("Enter Name"),
        content: TextField(
          controller: simpleController.simNameController,           // assigning the controller
        ), 
        actions: [
          TextButton(
            onPressed: (){
             simpleController.updateName(simpleController.simNameController.text);    // updating value
           Navigator.pop(context);
          }, child: const Text("save"))
        ],
      );
       });
       },
          title:  
          // Text(simpleController.name),
          GetBuilder<SimpleController>(                       // updating widget with getBuilder         
          builder: (controller) => 
          Text(controller.name)  ),
          subtitle: const Text("Name"),
          ),
           ])
          ,
    ));
  }
}