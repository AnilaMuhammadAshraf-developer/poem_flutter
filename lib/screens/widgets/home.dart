import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poem/utils/app_assets.dart';
import 'package:poem/utils/app_colors.dart';
import 'package:poem/utils/app_strings.dart';
import 'package:video_player/video_player.dart';

class HomeWidget extends StatefulWidget {
  final String deviceType;
  const HomeWidget({super.key, required this.deviceType});
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool _isLoading = true;

  late AnimationController _ballonController;
  late Animation<Offset> _animation;
 
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(AppAssets.appVideo)
      ..initialize().then((_) {
        setState(() {
          _isLoading = false;
        });
      });

    _ballonController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: false);

    _animation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, -1), 
    ).animate(CurvedAnimation(parent: _ballonController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget baloon() {
    return SlideTransition(
      position: _animation,
      child: Column(
        children: [
          Center(
            child: Icon(Icons.emoji_emotions, size: 50, color: Colors.yellow),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.emoji_emotions, size: 50, color: Colors.pink),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Icon(Icons.emoji_emotions, size: 50, color: Colors.blue),
          ),
            
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("yh hai device type:${widget.deviceType}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        title: Text(
          AppStrings.poemTitle,
          style: TextStyle(color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            (widget.deviceType == 'mobile')
                ? Center(
                  child: Column(
                    children: [
                      // baloon(),
                      SizedBox(height: 5),
                      Text("You are using Mobile."),
                      SizedBox(height: 5),
                      _isLoading
                          ? CircularProgressIndicator(
                            color: AppColors.appMainColor,
                          )
                          : Container(
                            margin: EdgeInsets.all(5),
                            width: 400,
                            height: 400,

                            decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          ),

                      SizedBox(height: 5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.appMainColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              _controller.value.isPlaying
                                  ? AppStrings.pauseBtn
                                  : AppStrings.playBtn,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                      baloon(),
                    ],
                  ),
                )
                : (widget.deviceType == 'tablet')
                ? Center(
                  child: Column(
                    children: [
                      // baloon(),
                      SizedBox(height: 5),
                      Text("You are using Tablet."),
                      SizedBox(height: 5),
                      _isLoading
                          ? CircularProgressIndicator(
                            color: AppColors.appMainColor,
                          )
                          : Container(
                            margin: EdgeInsets.all(5),
                            width: 400,
                            height: 400,

                            decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          ),

                      SizedBox(height: 5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.appMainColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              _controller.value.isPlaying
                                  ? AppStrings.pauseBtn
                                  : AppStrings.playBtn,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                      baloon(),
                    ],
                  ),
                )
                : Center(
                  child: Column(
                    children: [
                      //  baloon(),
                      Text("You are using Desktop."),

                      _isLoading
                          ? CircularProgressIndicator(
                            color: AppColors.appMainColor,
                          )
                          : Container(
                            margin: EdgeInsets.all(5),
                            width: 900,
                            height: 400,

                            decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          ),

                      SizedBox(height: 5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.appMainColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              _controller.value.isPlaying
                                  ? AppStrings.pauseBtn
                                  : AppStrings.playBtn,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                      baloon(),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
