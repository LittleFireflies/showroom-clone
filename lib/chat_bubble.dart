import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String username;
  final String chatMessage;

  ChatBubble({required this.username, required this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.network(
                      'https://stickerly.pstatic.net/sticker_pack/2E762coovoi62UiiQEjvDA/3GCLZX/3/1597629644.png'),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username),
                    Text(chatMessage),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
