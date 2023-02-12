import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sahem_app/features/auth/data/web_services/auth_web_services.dart';
import 'package:sahem_app/features/profile/data/web_services/profile_web_services.dart';
import 'package:sahem_app/helper/bloc_observer.dart';
import 'package:sahem_app/route/app_route.dart';
import 'package:sahem_app/route/route_path.dart';

void main() async {
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
 await Future.delayed(const Duration(seconds: 3));
    print('go!');
    FlutterNativeSplash.remove();
    Bloc.observer = MyBlocObserver();
     ProfileWebServices.init();
      AuthWebServices.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 892),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sahem',
            theme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.amber,
                selectedItemColor: HexColor('279FD2'),
                unselectedItemColor: Colors.grey,
                unselectedLabelStyle: TextStyle(color: Colors.grey)

              ),
              primarySwatch: Colors.blue,
              fontFamily: 'Vazirmatn'
            ),
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: welcomeScreen,
          );
        });
  }
}
