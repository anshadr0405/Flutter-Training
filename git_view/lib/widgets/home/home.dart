import 'package:flutter/material.dart';

import 'package:git_view/model/user.dart';
import 'package:git_view/networking/endpoint.dart';
import 'package:git_view/networking/network_manager.dart';
import 'package:git_view/widgets/details/user_details_screen.dart';
import 'dart:convert';

import '../custom/app_bar.dart';
import 'home_user_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50), child: CustomBarWidget()),
        body: FutureBuilder<List<User>>(
            future: _getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User>? data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: UserItem(user: data?[index]),
                        onTap: () {
                          MaterialPageRoute details = MaterialPageRoute(
                              builder: (context) => UserDetailsScreen(
                                    userID: data?[index].id?.toString(),
                                  ));
                          Navigator.push(context, details);
                        },
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }

  Future<List<User>> _getUsers() async {
    List<dynamic> response = await NetworkManager()
        .getRequest(APIEndPoints.urlString(EndPoints.users));

    return _usersFromJson(response);
  }

  List<User> _usersFromJson(List<dynamic> list) {
    List<User> users = list.map<User>((item) {
      return User.fromJson(item);
    }).toList();
    return users;
  }
}
