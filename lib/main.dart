import 'package:flutter/material.dart';
import 'package:noorflix/utils/app_routes.dart';
import 'package:noorflix/utils/app_strings.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title:AppStrings.appTitle,
      routerConfig: AppRoutes.appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}