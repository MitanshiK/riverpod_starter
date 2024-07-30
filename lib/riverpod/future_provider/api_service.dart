import 'dart:convert';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/riverpod/future_provider/user_info_model.dart';
// showing 

class ApiService {
   Future<List<DataModel>?> getUserdata() async {
    String url = "https://reqres.in/api/users?page=2";

    var response = await get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List result = jsonDecode(response.body)["data"];
      return result.map(((e) => DataModel.fromJson(e))).toList();
    } else {
      print("error occoured in getting api Data[Api Service]");
    }
  }
}

var apiProvider=Provider<ApiService>((ref) => ApiService());  // api provider will return ApiService 

var userDataProvider=FutureProvider<List<DataModel>?>((ref){   // userDataProvider will return FutureProvider
  return ref.read(apiProvider).getUserdata();
});