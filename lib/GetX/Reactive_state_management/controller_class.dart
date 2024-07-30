import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerClass extends GetxController{

final name = "Name".obs;    // .obs to make it observable 
final age = "0".obs;
final city = "Mohali".obs;
final followers = 0.obs;

final nameController=TextEditingController();
final ageController=TextEditingController();
final cityController=TextEditingController();
final followersController=TextEditingController();

void updateName(String Uname){
  name(Uname);
}

void updateAge(String Uage){
  age(Uage);              
}

void updateCity(String Ucity){
  city(Ucity);
}

void updateFollowers(){
  followers(followers.value+1);     // use [.value] for integer values
}


}