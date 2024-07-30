import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod_files/GetX/Reactive_state_management/controller_class.dart';

// reactive state managing using getX and obx
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});


  @override
  Widget build(BuildContext context) {
final infoController = Get.find<ControllerClass>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Info Screen"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
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
          controller: infoController.nameController,           // assigning the controller
        ), 
        actions: [
          TextButton(
            onPressed: (){
              infoController.updateName(infoController.nameController.text);     // updating value
          Get.back();
          }, child: const Text("save"))
        ],
      );
       });},
          title: Obx(                    // obx observes the variables in the controller with obs and rebuilds the widget 
          () => Text(
         infoController.name.value
          ) ),
          subtitle: const Text("Name"),
          ),
            // age
        ListTile(  
          onTap: (){
         showDialog(
            context: context, 
            builder: (BuildContext context) {
              return  AlertDialog(
        title:const Text("Enter Age"),
        content: TextField(
          controller: infoController.ageController,           // assigning the controller
        ), 
        actions: [
          TextButton(
            onPressed: (){
              infoController.updateAge(infoController.ageController.text);     // updating value
           Get.back();
          }, child: const Text("save"))
        ],
      );
       })
       ;},
          title: Obx(                    // obx observes the variables in the controller with obs and rebuilds the widget 
          () => Text(
         infoController.age.value
          ) ),
          subtitle: const Text("Age"),
          ),


            // city
        ListTile(  
          onTap: (){
           showDialog(
            context: context, 
            builder: (BuildContext context) {
              return  AlertDialog(
        title:const Text("Enter City"),
        content: TextField(
          controller: infoController.cityController,           // assigning the controller
        ), 
        actions: [
          TextButton(
            onPressed: (){
              infoController.updateCity(infoController.cityController.text);     // updating value
          Get.back();
          }, child: const Text("save"))
        ],
      );
       });},
          title:                               // using GetX insteadof obx
           GetX<ControllerClass>(               // passing controllercalss as type    
          builder: (controller) => Text(
          infoController.city.value
           ) 
          ),
          subtitle: const Text("City"),
          ),

            // followers
        ListTile(  
          onTap: (){
           showDialog(
            context: context, 
            builder: (BuildContext context) {
              return  AlertDialog(
        title:const Text("manage Follower counter"),
        content: 
        ///////
         Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Obx( () => Text(infoController.followers.value.toString() ,style: const TextStyle(fontSize: 20) )),
            const SizedBox(height: 20,),
       
           ElevatedButton(onPressed: (){ 
                infoController.updateFollowers();
          }, child: const Text("+" ,style: TextStyle(fontSize: 30))),  // updating value
   

        ],),
        /// 
        actions: [
          TextButton(
            onPressed: (){
           Get.back();
          }, child: const Text("save"))
        ],
      );
       });},
          title: Obx(                    // obx observes the variables in the controller with obs and rebuilds the widget 
          () => Text(
         infoController.followers.value.toString()
          ) ),
          subtitle: const Text("Followers"),
          )
          ],
        ),
      ),
    );
  }
}
