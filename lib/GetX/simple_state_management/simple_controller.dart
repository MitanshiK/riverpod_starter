
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
class SimpleController extends GetxController{
String name="Name";      // variables not observable
int followers=0;

final simNameController=TextEditingController();
final simFollowersController=TextEditingController();

void incrementFoll(){
  followers=followers++;
  update();  // update fun to update the widget 
}

void updateName(String Uname){
  name=Uname;
  update();
}

}