import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/counter_app.dart/riverpod_providers/incre_provider.dart';

class Screen2 extends ConsumerWidget {
   Screen2({super.key});

  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
  final num =ref.watch(incrementNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Screen 2"),  backgroundColor: Colors.white,),
      body: Center(
        child: Column(
          children: [
            Text(num.toString(),style: TextStyle(fontSize: 30)),
            SizedBox(height: 20,),
       

        ],),),
    );
  }
}