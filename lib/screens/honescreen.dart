import 'package:apiurl/models/User.dart';

import 'package:apiurl/screens/userinfo.dart';
import 'package:apiurl/screens/card.dart';
import 'package:apiurl/services/userService.dart';
import 'package:apiurl/functions.dart';
import 'package:flutter/material.dart';


class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List <User> users = [];
  getUserList() async {
    users = await UserService().getUsers();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        title: Text("Users"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
                onTap: () {
                  pushPage(context, UserDetails(users[index]));
                },
                child: MyCard(content: "${users[index].name}")),
          );
        },
      ),
    );
  }
}
