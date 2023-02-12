import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahem_app/features/layout/presentation/screens/profile_screen.dart';
import 'package:sahem_app/features/layout/presentation/screens/profile_screen.dart';
import '../../profile/presentation/screens/demo.dart';
import '../../profile/presentation/screens/main_screen.dart';
import 'package:sahem_app/features/layout/business_logic/layout_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'الرئيسية',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.account_box,
      ),
      label: 'حساباتي',
    ),
    // ignore: prefer_const_constructors
    BottomNavigationBarItem(
      // ignore: prefer_const_constructors
      icon: Icon(
        Icons.sports,
      ),
      label: 'بلاغاتي',
    ),
    const BottomNavigationBarItem(
      // ignore: prefer_const_constructors
      icon: Icon(
        Icons.settings,
      ),
      label: 'الاعدادات',
    ),
  ];
  void ChangeBottomNavBar(index) {
    currentIndex = index;

    emit(AppBottomNavState());
  }

  List<Widget> Screens = [
     MainScreen(),
     
     ProfileScreen(),
    const DemoScreen(),
    const DemoScreen()
  ];
}
