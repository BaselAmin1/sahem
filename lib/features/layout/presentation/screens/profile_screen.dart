import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_button.dart';
import 'package:sahem_app/features/layout/presentation/widgets/card_profile.dart';
import 'package:sahem_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:sahem_app/helper/constants/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          if (kUser.result == null && kFormattedDate == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 70.h),
                      child: Center(
                          child: Image.asset(
                        'assets/images/Group.png',
                      )),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'المعلومات الشخصية',
                      style: TextStyle(color: Colors.white, fontSize: 32.sp),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 150.0.w, right: 150.0.w),
                        child: Divider(
                          color: Colors.green,
                          height: 25.h,
                          thickness: 1.sp,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 280.w),
                            child: Text(
                              'الاسم',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            ),
                          ),
                          CardFb2(
                            text:
                                kUser.result == null ? '' : kUser.result!.name!,
                            onPressed: () {},
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 270.w),
                            child: Text(
                              ' الهاتف',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            ),
                          ),
                          CardFb2(
                            text: kUser.result == null
                                ? ''
                                : kUser.result!.phone!,
                            onPressed: () {},
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 180.w),
                            child: Text(
                              ' البريد الألكتروني',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            ),
                          ),
                          CardFb2(
                            text: 'Ahmed-Kamal@gmail.com',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    DefaultButton(
                      onPressed: () {},
                      childText: 'حفظ المتغيرات',
                      color: Colors.white,
                      textColor: Color(0xFF2BB9D8),
                    ),
                  ]),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
