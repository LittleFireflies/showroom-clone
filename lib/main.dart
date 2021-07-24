import 'package:flutter/material.dart';
import 'package:showroom_clone/stage_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            StageView(
              fullWidth: width * 1.5,
              screenWidth: width,
              screenHeight: height,
            ),
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        Flexible(
                          child: Text(
                            'Beby Chaesara Anadila',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Text(
                          '14,045',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
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
                                    chatMessage:
                                        'Kak waro aku dong, nanti aku VC',
                                  ),
                                  ChatBubble(
                                    username: 'username',
                                    chatMessage:
                                        'Kak waro aku dong, nanti aku VC',
                                  ),
                                  ChatBubble(
                                    username: 'username',
                                    chatMessage:
                                        'Kak waro aku dong, nanti aku VC',
                                  ),
                                  ChatBubble(
                                    username: 'username',
                                    chatMessage:
                                        'Kak waro aku dong, nanti aku VC',
                                  ),
                                  ChatBubble(
                                    username: 'username',
                                    chatMessage:
                                        'Kak waro aku dong, nanti aku VC',
                                  ),
                                  ChatBubble(
                                    username: 'username',
                                    chatMessage:
                                        'Kak waro aku dong, nanti aku VC',
                                  ),
                                  ChatBubble(
                                    username: 'username',
                                    chatMessage:
                                        'Kak waro aku dong, nanti aku VC',
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
            ),
          ],
        ),
      ),
    );
  }
}

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
