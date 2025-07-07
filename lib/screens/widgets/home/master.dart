import 'package:flutter/material.dart';
import 'package:noorflix/screens/widgets/home/desktop.dart';
import 'package:noorflix/screens/widgets/home/mobile.dart';
import 'package:noorflix/screens/widgets/home/tablet.dart';
import 'package:noorflix/utils/app_colors.dart';
import 'package:noorflix/utils/app_strings.dart';



class MasterWidget extends StatelessWidget {
  final String deviceType;
  const MasterWidget({super.key, required this.deviceType});
  
  @override
  Widget build(BuildContext context) {
    print("yh hai device type:${deviceType}");

    return Scaffold(
      backgroundColor:AppColors.appYellowColor,
      appBar: AppBar(
        backgroundColor: AppColors.appLightColor,
        title: Text(
          AppStrings.noorflixTitle,
          style: TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(right:16,left:16,top:16,bottom: 5),
      decoration: BoxDecoration(
       
      ),
      child:(deviceType == AppStrings.mobileDeviceType)
                ? HomeMobile()
                : (deviceType == AppStrings.tabletDeviceType)
                ? HomeTablet()
                : HomeDesktop(),
      ),
      
    );
  }
}
