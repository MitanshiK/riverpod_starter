import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:riverpod_files/GetX/Reactive_state_management/binding_class.dart';
import 'package:riverpod_files/GetX/Reactive_state_management/info_screen.dart';
import 'package:riverpod_files/GetX/simple_state_management/info_screen2.dart';
import 'package:riverpod_files/counter_app.dart/screen/screen1.dart';
import 'package:riverpod_files/riverpod/future_provider/data_screen.dart';
import 'package:riverpod_files/riverpod/shopping_cart/screens/home/home_screen.dart';
import 'package:riverpod_files/riverpod/state_provider_notifier/todo_list_screen.dart';

void main() {
 runApp(const ProviderScope(child:  MyApp()));        // providerScope for riverpod

//  runApp(  MyApp()); 

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 

    // GetMaterialApp to user Getx (reactive state management)
    GetMaterialApp(  
      debugShowCheckedModeBanner: false,                
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      initialBinding: BindingClass(),              // binding class for dependency injection for ControllerClass
      home: TodoListScreen(),
    );

    //   MaterialApp(                  
    //   title: 'State Management',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
    //   ),
    //   home: InfoScreen2(),
    // );
  }
}