import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/riverpod/future_provider/api_service.dart';

class ApiDataClass extends ConsumerWidget {
  const ApiDataClass({super.key});


  @override
  Widget build(BuildContext context ,WidgetRef ref) {
 var _data=ref.watch(userDataProvider);  // getting provider data
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Api data using RiverPod futureProvider"),
      backgroundColor: Colors.white,),
      body: _data.when(
        data: (_data){
          return  Column(
              children: [
                     ..._data!.map((e)=>ConstrainedBox(
            
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width
            ),
       
               child:  ListTile(
                  title: Text("${e.first_name!} ${e.last_name!}"),
                  subtitle: Text(e.email!),
                  trailing: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber,
                    backgroundImage: NetworkImage(e.avatar!),
                  ),
                )
        ) )
              ],
          
          );
        },
         error: (Object error, StackTrace stackTrace) {
          return Text(" error occured $error");
           },
          loading: () {  
            return const Center(child: CircularProgressIndicator());
          }, 
        ),
    );
  }
}