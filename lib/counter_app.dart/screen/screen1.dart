import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/counter_app.dart/riverpod_providers/incre_provider.dart';
import 'package:riverpod_files/counter_app.dart/screen/screen2.dart';

class Screen1 extends ConsumerWidget {
   Screen1({super.key});

  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
  final num =ref.watch(incrementNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Screen 1"), 
       backgroundColor: Colors.white,
       actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
       }, icon: Icon(Icons.arrow_forward))],
       ),
      body: Center(
        child: Column(
          children: [
            Text(num.toString(),style: TextStyle(fontSize: 30)),
            SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          ElevatedButton(onPressed: (){ 
               ref.read(incrementNotifierProvider.notifier).decrement();
          }, child: Text("-" ,style: TextStyle(fontSize: 30),)),
           ElevatedButton(onPressed: (){ 
                  ref.read(incrementNotifierProvider.notifier).icrement();
          }, child: Text("+" ,style: TextStyle(fontSize: 30))),
        ],)

        ],),),
    );
  }
}