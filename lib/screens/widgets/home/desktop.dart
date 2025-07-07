import 'package:flutter/material.dart';
import 'package:noorflix/constants/app_data.dart';
import 'package:noorflix/utils/app_colors.dart';
import 'package:noorflix/utils/app_strings.dart';
import 'package:video_player/video_player.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});
  @override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  late List<VideoPlayerController> controllers;
  int? currentlyPlayingIndex;

  void onClick(controller,index){
      setState(() {
    if (currentlyPlayingIndex != null &&
          currentlyPlayingIndex != index) {
        controllers[currentlyPlayingIndex!].pause();
      }

      // Toggle play/pause for current video
      if (controller.value.isPlaying) {
        controller.pause();
        currentlyPlayingIndex = null;
      } else {
        controller.play();
        currentlyPlayingIndex = index;
      }
      });
  }
  @override
  void initState() {
    super.initState();
    controllers =
        AppData().naatList.map((video) {
          final controller = VideoPlayerController.network(video['file'])
            ..initialize().then((_) => setState(() {}));
          return controller;
        }).toList();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.pause();
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Center(child: Text("desktop")),
       
            Text(AppStrings.mainHeading,style: TextStyle(color:AppColors.blackColor,fontSize: 32,fontWeight: FontWeight.bold),),
            Text(AppStrings.detailText,style: TextStyle(color:AppColors.blackColor,fontWeight: FontWeight.w500)),
        SizedBox(height:20),
        Expanded(
          child: Container(
          
            decoration: BoxDecoration(
              color: AppColors.appLightColor,
            ),
          child:GridView.builder(
            itemCount: AppData().naatList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var naat = AppData().naatList[index];
              final controller = controllers[index];

              return Container(
                padding: EdgeInsets.all(10),
                 margin: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppColors.appYellowColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height:15),
                    controller.value.isInitialized
                        ? Container(
                          
                          decoration: BoxDecoration(
                            color:Colors.black,
                          
                          ),
                          height: 300,
                          width: double.infinity,
                          child: VideoPlayer(controller),
                        )
                        : SizedBox(
                          height: 300,
                          child: Center(child: CircularProgressIndicator()),
                        ),

                    Text(naat['title'],style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    IconButton(
                      icon: Icon(
                        controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed:()=>onClick(controller,index),
                        
                      
                    ),
                  ],
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 4/ 3,
            ),
          ),
        ),
        ),
      ],
    );
  }
}
