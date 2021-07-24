import 'package:flutter/material.dart';
import 'package:showroom_clone/chat_bubble.dart';

class MenuSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.5,
      builder: (contect, scrollController) {
        return Container(
          color: Colors.teal.withOpacity(0.2),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.comment_sharp,
                      color: Colors.lightGreen,
                    ),
                    Icon(
                      Icons.flash_on,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ChatBubble(
                            username: 'username',
                            chatMessage: 'Chika mana?',
                          ),
                          ChatBubble(
                            username: 'username',
                            chatMessage: 'Kak waro aku dong, nanti aku VC',
                          ),
                          ChatBubble(
                            username: 'username',
                            chatMessage: 'Kak waro aku dong, nanti aku VC',
                          ),
                          ChatBubble(
                            username: 'username',
                            chatMessage: 'Kak waro aku dong, nanti aku VC',
                          ),
                          ChatBubble(
                            username: 'username',
                            chatMessage: 'Kak waro aku dong, nanti aku VC',
                          ),
                          ChatBubble(
                            username: 'username',
                            chatMessage: 'Kak waro aku dong, nanti aku VC',
                          ),
                          ChatBubble(
                            username: 'username',
                            chatMessage: 'Kak waro aku dong, nanti aku VC',
                          ),
                          ChatBubble(
                            username: 'username',
                            chatMessage: 'Kak waro aku dong, nanti aku VC',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
