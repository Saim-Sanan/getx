import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx/user.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxBool isDisplayed = RxBool(false);
  Rx<User> user = User(userId: 0, id: 0, title: '', completed: true).obs;
  Future<void> fetchData() async {
    isLoading(true);
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var body = json.decode(response.body);

        user.value = User.fromJson(body);
        // return user;
      } else {
        print("error");
        // return null;
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}
