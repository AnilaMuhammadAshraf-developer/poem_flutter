import 'package:go_router/go_router.dart';
import 'package:poem/screens/home.dart';

class AppRoutes {
  static final appRouter=GoRouter(
    
    routes: [
       
      GoRoute(
        path:'/',
        name:'home',
        builder: (context,state)=>const HomeScreen(),
        )
    ]
  
  
  );
}