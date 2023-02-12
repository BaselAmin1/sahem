import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_text_form_field.dart';
import 'package:sahem_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:sahem_app/features/profile/presentation/widgets/custom_card.dart';
import 'package:sahem_app/helper/constants/strings.dart';
import 'package:sahem_app/route/route_path.dart';


class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  //final now = new ;

  //= DateFormat.yMMMMd('en_US').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUser()..getDate(),
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
              body: SingleChildScrollView(
                child: Container(
                  height: 950.h,
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
                      Container(
                        width: double.infinity,
                        height: 250.h,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 0,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(60.sp),
                                bottomRight: Radius.circular(60.sp))),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
                            child: Text(
                              'قائمه البلاغات',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              children: [
                                Column(
                                  children: const [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/person.png')),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          kUser.result == null
                                              ? ''
                                              : '! ' + kUser.result!.name!,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          ' ،مرحبا',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      kFormattedDate == null
                                          ? ''
                                          : kFormattedDate!,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: DefaultTextFormField(
                              label: '...ابحث عن خدمات',
                              suffixIcon: Icons.search,
                            ),
                          )
                        ]),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, reportScreen),
                                  child: customCard(
                                      'حفر الشوارع',
                                      const AssetImage(
                                          'assets/images/icon_1.png')),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, reportScreen),
                                  child: customCard(
                                      'اعمده الاناره',
                                      const AssetImage(
                                          'assets/images/icon_2.png')),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, reportScreen),
                                  child: customCard(
                                      'تسريبات المياه',
                                      const AssetImage(
                                          'assets/images/icon_3.png')),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, reportScreen),
                                  child: customCard(
                                      'تشوه بصري',
                                      const AssetImage(
                                          'assets/images/icon_4.png')),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, reportScreen),
                                  child: customCard(
                                      'ازعاج صوتي',
                                      const AssetImage(
                                          'assets/images/icon_5.png')),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, reportScreen),
                                  child: customCard(
                                      'الحدائق العامه',
                                      const AssetImage(
                                          'assets/images/icon_6.png')),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, reportScreen),
                                  child: customCard(
                                      'تسريبات الغاز',
                                      const AssetImage(
                                          'assets/images/icon_7.png')),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, reportScreen),
                                  child: customCard(
                                      'حادث مروري',
                                      const AssetImage(
                                          'assets/images/icon_8.png')),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, reportScreen),
                                  child: customCard(
                                      'حيوانات ضاله',
                                      const AssetImage(
                                          'assets/images/icon_9.png')),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
