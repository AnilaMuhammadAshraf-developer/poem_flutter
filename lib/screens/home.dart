import 'package:flutter/material.dart';
import 'package:poem/layout/responsive_layout.dart';
import 'package:poem/screens/widgets/home.dart';
import 'package:poem/utils/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: HomeWidget(deviceType: AppStrings.mobileDeviceType),
      tablet: HomeWidget(deviceType:AppStrings.tabletDeviceType),
      desktop: HomeWidget(deviceType:AppStrings.desktopDeviceType),
    );
  }
}
