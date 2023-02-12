import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahem_app/features/auth/business_logic/auth_cubit.dart';
import 'package:sahem_app/features/auth/presentation/screens/register_screen.dart';
import 'package:sahem_app/features/layout/presentation/screens/app_layout.dart';
import 'package:sahem_app/features/auth/presentation/screens/login_screen.dart';
import 'package:sahem_app/features/layout/presentation/screens/welcome_screen.dart';
import 'package:sahem_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:sahem_app/features/profile/presentation/screens/camera_screen.dart';
import 'package:sahem_app/features/profile/presentation/screens/main_screen.dart';
import 'package:sahem_app/features/profile/presentation/screens/report_screen.dart';
import 'package:sahem_app/features/layout/presentation/screens/thanks_screen.dart';
import 'route_path.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    AppRouter();

    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            
            create: (context)=>AuthCubit(),
            child:LoginScreen() ,
            )
          
        );
      case thanksScreen:
        return MaterialPageRoute(
          builder: (_) => const ThanksScreen(),
        );
      case mainScreen:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => ProfileCubit(),
            child: MainScreen(),
          ),
        );
      case reportScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProfileCubit()..getLocation(),
            child: ReportScreen(),
          ),
        );
      case appLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => const AppLayout(),
        );
      case cameraScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProfileCubit(),
            child: CameraScreen(),
          ),
        );

         case registerScreen:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create:(context)=>AuthCubit(),
            child: RegisterScreen() ,
          )
         
        );
    }
    return null;
  }
}
