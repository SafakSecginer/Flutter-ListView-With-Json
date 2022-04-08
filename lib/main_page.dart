import 'package:flutter/material.dart';

import 'user.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  List<User> users = getUsers();

  static List<User> getUsers() {
    const data = [
      {
        "username": "John",
        "email": "john@gmail.com",
        "urlAvatar":
            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      },
      {
        "username": "Mike",
        "email": "mike@gmail.com",
        "urlAvatar":
            "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      }
    ];
    return data.map<User>(User.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView With JSON'),
          centerTitle: true,
        ),
        body: Center(
          child: buildUsers(users),
        ));
  }

  Widget buildUsers(List<User> users) => ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(user.urlAvatar!),
              ),
              title: Text(user.username!),
              subtitle: Text(user.email!),
            ),
          );
        },
      );
}
