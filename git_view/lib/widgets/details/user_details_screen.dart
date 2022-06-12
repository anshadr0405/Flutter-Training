import 'package:flutter/material.dart';
import 'package:git_view/networking/endpoint.dart';
import 'package:git_view/widgets/details/user_details_widget.dart';

import '../../model/user_details.dart';
import '../../networking/network_manager.dart';
import '../custom/app_bar.dart';
import '../home/home_user_item.dart';

class UserDetailsScreen extends StatefulWidget {
  final String? userID;

  const UserDetailsScreen({super.key, this.userID});
  @override
  UserDetailsState createState() => UserDetailsState();
}

class UserDetailsState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50), child: CustomBarWidget()),
        body: FutureBuilder<UserDetails>(
            future: _getUsersDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserDetails? data = snapshot.data;
                return UserDetailsWidget(userDetails: data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }

  Future<UserDetails> _getUsersDetails() async {
    dynamic userDetailsString = await NetworkManager().getRequest(
        APIEndPoints.urlString(EndPoints.details) + (widget.userID ?? ""));
    UserDetails userDetails = UserDetails.fromJson(userDetailsString);

    return userDetails;
  }
}
