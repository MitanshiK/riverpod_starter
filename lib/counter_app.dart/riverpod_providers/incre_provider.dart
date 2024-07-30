
import 'package:riverpod_annotation/riverpod_annotation.dart';


class IncrementNotifier extends Notifier<int>{

  @override
  int build() {
   return 0;
  }

  void icrement(){
   state=state+1;
  }

  void decrement(){
  if(state!=0){
    state=state-1;
  }
  }

}

final incrementNotifierProvider=NotifierProvider <IncrementNotifier,int>((){
 return IncrementNotifier();
}) ;