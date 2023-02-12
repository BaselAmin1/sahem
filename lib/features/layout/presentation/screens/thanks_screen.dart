import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_button.dart';
import 'package:sahem_app/route/route_path.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 80.h,
          ),
          child: const Image(image: AssetImage('assets/images/logo_1.png')),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            bottom: 15.h,
            left: 25.w,
            right: 25.w,
          ),
          child: Text(
            '!شكرا لك',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 62.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2BB9D8),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 25.h,
            bottom: 15.h,
            left: 25.w,
            right: 25.w,
          ),
          child: Text(
            '.تم إنشاء بلاغك رقم230842',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            '.سيتم التواصل معك عن طريق فريقنا في خلال 24 ساعة للتأكيد على شكواك',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 18.h,
            top: 45.h,
            left: 30.w,
            right: 30.w,
          ),
          child: DefaultButton(
              onPressed: () {
                Navigator.pushNamed(context, appLayoutScreen);
              },
              childText: 'ارجع للرئيسيه',
              color: const Color(0xFF2BB9D8),
              textColor: Colors.white),
        ),
      ],
    ));
  }
}
