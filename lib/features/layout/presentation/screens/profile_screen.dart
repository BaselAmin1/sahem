import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahem_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:sahem_app/helper/constants/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is SendReportSuccessState) {
            kPlacemarks = null;
            kPickedImage = null;
            kC1 = null;
            kB1 = 0;
            kB2 = 0;
            print(kPlacemarks);
            print(kPickedImage);

            print(kC1);

            print(kB1);

            print(kB2);
          }
        },
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
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
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
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 350.w),
                    child: Text(
                      ' الاسم ',
                      style: TextStyle(color: Colors.white, fontSize: 22.sp),
                    ),
                  ),
                  Text(
                                    kUser.result == null
                                        ? ''
                                        :   kUser.result!.name!,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                  SizedBox(
                    height: 250.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 350.w),
                    child: Text(
                      ' الهاتف',
                      style: TextStyle(color: Colors.white, fontSize: 22.sp),
                    ),
                  ),
                 Text(
                                    kUser.result == null
                                        ? ''
                                        :  kUser.result!.phone!,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                ]),
              ),
            );
          }
        },
      ),
    );
  }
}
