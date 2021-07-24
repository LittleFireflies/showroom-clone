import 'package:flutter/material.dart';
import 'package:showroom_clone/user_avatar.dart';

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
