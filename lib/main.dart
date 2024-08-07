import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:redux/redux.dart';
import 'package:riverpod_files/GetX/Reactive_state_management/binding_class.dart';
import 'package:riverpod_files/GetX/Reactive_state_management/info_screen.dart';
import 'package:riverpod_files/GetX/simple_state_management/info_screen2.dart';
import 'package:riverpod_files/counter_app.dart/screen/screen1.dart';
import 'package:riverpod_files/redux/redux_counter.dart';
import 'package:riverpod_files/riverpod/future_provider/data_screen.dart';
import 'package:riverpod_files/riverpod/shopping_cart/screens/home/home_screen.dart';
import 'package:riverpod_files/riverpod/state_provider_notifier/todo_list_screen.dart';

void main() {
  

  runApp(const ProviderScope(child:  MyApp()));        // providerScope for riverpod
 final store=Store(
  counterReducer,        // reducer pure function
  initialState: CounterState.initial()   // initial state
  );
 // we use a subscription variable so that we can stop listening to changes whenever we want by cancelling  
 // the subscription
 final subscription=store.onChange.listen((CounterState state){     
    print("current state is $state");
 });

 store.dispatch(const IncrementAction(payload: 2));
 store.dispatch(const IncrementAction(payload: 6));
 store.dispatch(const DecrementAction(payload: 1));

subscription.cancel();
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
//android 
// https://we.tl/t-FekSJx2PeD

//ios
//https://we.tl/t-AgJ507O5BN

//lib
//https://we.tl/t-CxoUIA9J38

// example lib
//https://we.tl/t-OxNaEy6hbz