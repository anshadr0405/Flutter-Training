import 'package:flutter/material.dart';

import '../../model/user.dart';

class UserItem extends StatelessWidget {
  final User? user;

  const UserItem({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  user?.avatarUrl ?? "",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(user?.login ?? "", overflow: TextOverflow.clip)
              ]),
        ));
  }
}
