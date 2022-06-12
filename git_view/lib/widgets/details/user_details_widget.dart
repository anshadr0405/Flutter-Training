import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_view/model/user_details.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserDetails? userDetails;

  const UserDetailsWidget({super.key, required this.userDetails});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
            width: double.infinity,
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(userDetails?.avatarUrl ?? ""),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      userDetails?.login ?? "",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Number of Public repos: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(userDetails?.publicRepos.toString() ?? "0")
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "FOllowers: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(userDetails?.followers.toString() ?? "0")
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Email:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(userDetails?.email ?? "NA")
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Twitter:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(userDetails?.twitterUsername ?? "NA")
                      ],
                    )
                  ]),
            ))));
  }
}
