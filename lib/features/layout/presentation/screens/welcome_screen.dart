import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_button.dart';
import 'package:sahem_app/route/route_path.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 90.h,
                  bottom: 90.h,
                  left: 55.w,
                  right: 55.w,
                ),
                child: Text(
                  'خدمتك البلديه، الان رقمية',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Image(
                image: const AssetImage('assets/images/person_1.png'),
                width: 270.w,
                height: 270.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 85.h,
                  bottom: 15.h,
                  left: 25.w,
                  right: 25.w,
                ),
                child: Text(
                  '.تم إنشاء ساهم للتعامل مع جميع قضايا الحي الخاص بك ، من خلال وجود خط مباشر مع السلطة المسؤولة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Text(
                  '.يتيح لك تطبيقنا الإبلاغ عن أي حادث وإدراج صوره في القسم الصحيح',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 28.h,
                  top: 105.h,
                  left: 30.w,
                  right: 30.w,
                ),
                child: DefaultButton(
                  onPressed: () {
                    Navigator.pushNamed(context, registerScreen);
                  },
                  childText: '!هيا بنا',
                  color: Colors.white,
                  textColor: const Color(0xFF2BB9D8),
                ),
              )
            ],
          )),
    );
  }
}
