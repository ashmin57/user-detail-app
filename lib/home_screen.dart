import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:userdetail/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  Future<List<User>> users() async {
    try {
      var url = Uri.https('jsonplaceholder.typicode.com', 'users');
      final response = await http.get(url);
      // print(response.statusCode);
      // print(response.body.runtimeType);
      final decodedResponse = jsonDecode(response.body);
      // print("decoded Resonse: ${decodedResponse.runtimeType}");
      List<User> users = [];
      for (var u in decodedResponse) {
        User user = User(
          u["id"],
          u["name"],
          u["username"],
          u["email"],
          u["address"],
          u["phone"],
          u["website"],
        );
        users.add(user);
      }
      // print(users.length);
      return users;
      // print("first data:$firstData");
    } catch (e) {
      // print('error $e');
      return [];
    }
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}
