import 'dart:math';

import 'package:flutter/material.dart';
import 'package:showroom_clone/dummy_data.dart';

class UserAvatar extends StatelessWidget {
  final String username;

  UserAvatar({required this.username});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 48,
          child: Image.network(avatars[Random().nextInt(avatars.length)]),
        ),
        Container(
          color: Colors.black54,
          child: Text(
            username,
            maxLines: 1,
            style: TextStyle(fontSize: 8, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
