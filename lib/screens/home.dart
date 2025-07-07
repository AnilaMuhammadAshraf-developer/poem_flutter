import 'package:flutter/material.dart';
import 'package:noorflix/layout/responsive_layout.dart';
import 'package:noorflix/screens/widgets/home/master.dart';
import 'package:noorflix/utils/app_strings.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MasterWidget(deviceType: AppStrings.mobileDeviceType),
      tablet: MasterWidget(deviceType:AppStrings.tabletDeviceType),
      desktop: MasterWidget(deviceType:AppStrings.desktopDeviceType),
    );
  }
}
