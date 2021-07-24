import 'dart:math';

import 'package:flutter/material.dart';

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

class StageView extends StatefulWidget {
  final double fullWidth;
  final double screenWidth;
  final double screenHeight;

  const StageView(
      {this.fullWidth = 0, this.screenWidth = 0, this.screenHeight = 0});

  @override
  _StageViewState createState() => _StageViewState();
}

class _StageViewState extends State<StageView> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    final position = (widget.fullWidth - widget.screenWidth) / 2;
    _transformationController.value = Matrix4.identity()..translate(-position);
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: _transformationController,
      constrained: false,
      minScale: 0.1,
      // maxScale: 5,
      child: Container(
        color: Colors.blueGrey,
        width: widget.fullWidth,
        height: widget.screenHeight,
        child: Column(
          children: [
            Container(
              color: Colors.black54,
              height: 0.4 * widget.screenHeight,
              width: widget.screenWidth * 0.9,
              child: Center(
                child: Text(
                  'Screen',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              height: 0.1 * widget.screenHeight,
              width: widget.screenWidth * 0.9,
              child: Center(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 13,
                  childAspectRatio: 1 / 2,
                  children: List.generate(
                    13,
                    (index) => UserAvatar(
                      username: 'User#$index',
                    ),
                  ),
                ),
              ),
              // child: Center(
              //   child: Text('Podium'),
              // ),
            ),
            Expanded(
              child: Container(
                color: Colors.blueGrey,
                width: widget.screenWidth,
                margin: const EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 13,
                    childAspectRatio: 1 / 2,
                    children: [
                      for (var i = 13; i < 100; i++)
                        UserAvatar(
                          username: 'User#$i',
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

final avatars = [
  'https://stickerly.pstatic.net/sticker_pack/2E762coovoi62UiiQEjvDA/3GCLZX/3/1597629644.png',
  'https://w7.pngwing.com/pngs/43/793/png-transparent-showroom-kobe-collection-%E3%82%B9%E3%82%BF%E3%83%B3%E3%83%87%E3%82%A3%E3%83%B3%E3%82%B0%E3%83%90%E3%83%BC-%E3%83%A2%E3%83%BC%E3%83%AA%E3%82%A8-music-avatar-banaba-food-fruit-showroom.png',
  'https://lh3.googleusercontent.com/proxy/D2SsNg307Z4O7HFEcQlE0-1BecLxHS_8ReTZz3ajpTAv3EJXkiZSBET7nPUGGl5qXmu96GD58Ya-o7-OFQBvaEz19a4Sa6lex49KxKJ53mDjrCb3yz9MXJ7dT8k6TFrH3ArK874_BvHsoU9ac7Xlvt25PgRc',
];
