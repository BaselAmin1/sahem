import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_button.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_text_form_field.dart';
import 'package:sahem_app/features/auth/presentation/widgets/snack_bar.dart';
import 'package:sahem_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:sahem_app/features/profile/presentation/widgets/show_dialog.dart';
import 'package:sahem_app/features/profile/presentation/widgets/space_line.dart';
import 'package:sahem_app/helper/constants/strings.dart';
import 'package:sahem_app/route/route_path.dart';

class ReportScreen extends StatelessWidget {
  int val1 = 0;
  int val2 = 0;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final GlobalKey<FormState> reportKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        print(kPlacemarks);
        if (state is ProfileInitial && kProblem != null) {
          descriptionController.text = kProblem!;
        }
        if (state is SendReportSuccessState) {
          kPlacemarks = null;
          kPickedImage = null;
          kC1 = null;
          kProblem = null;
          kB1 = 0;
          kB2 = 0;

          showSnackBar(context, 'Report Send Success .');
          Navigator.pushReplacementNamed(context, thanksScreen);
          print('report is success');
        }
        if (state is PickImageCameraSuccessState ||
            state is PickImageGallerySuccessState) {
          Navigator.pushNamed(context, cameraScreen);
        }
        if (state is SendReportErrorState) {
          showSnackBar(context, 'Please try again later .');
          print(state.error);
        }
      },
      builder: (context, state) {
        // kProblem = descriptionController.text;
        print(kPlacemarks);
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          body: Form(
            key: reportKey,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Text(
                        'بلاغ جديد',
                        style: TextStyle(
                          fontSize: 34.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        'يرجى إدخال المعلومات الصحيحة في المربع الميداني، ويمكنك تضمين أكبر قدر من المعلومات كما تريد، وسيتولى أخصائي من الفريق الحكومي البلاغ.',
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'الاسم',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: DefaultTextFormField(hintText: 'أحمد كمال'),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const SpaceLine(),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'رقم الهاتف',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: DefaultTextFormField(hintText: '0102079727 '),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    const SpaceLine(),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      ' هل المشكلة تعتبر حالة طارئة؟',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => cubit.changeBotooms2(),
                            child: Container(
                              width: 155.w,
                              height: 50.h,
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: kB1 == 1
                                          ? Image.asset(
                                              'assets/images/false-circle1.png',
                                            )
                                          : Image.asset(
                                              'assets/images/false-circle.png',
                                            )),
                                  SizedBox(
                                    width: 90.w,
                                  ),
                                  Text(
                                    'لا',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: kB1 == 2
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: kB1 == 2 ? Colors.red : Colors.white,
                                  borderRadius: BorderRadius.circular(15.r)),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => cubit.changeBotooms1(),
                            child: Container(
                              width: 155.w,
                              height: 50.h,
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: kB1 == 1
                                          ? Image.asset(
                                              'assets/images/true-circle.png',
                                              color: Colors.white,
                                            )
                                          : Image.asset(
                                              'assets/images/true-circle1.png',
                                            )),
                                  SizedBox(
                                    width: 80.w,
                                  ),
                                  Text(
                                    'نعم',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: kB1 == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: kB1 == 1 ? Colors.green : Colors.white,
                                  borderRadius: BorderRadius.circular(15.r)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const SpaceLine(),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'هل تم تقديم شكوى رسمية في جهة اخرى من قبل؟',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => cubit.changeBotooms4(),
                            child: Container(
                              width: 155.w,
                              height: 50.h,
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: kB2 == 2
                                          ? Image.asset(
                                              'assets/images/false-circle.png',
                                            )
                                          : Image.asset(
                                              'assets/images/false-circle1.png',
                                            )),
                                  SizedBox(
                                    width: 90.w,
                                  ),
                                  Text(
                                    'لا',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: kB2 == 2
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: kB2 == 2 ? Colors.red : Colors.white,
                                  borderRadius: BorderRadius.circular(15.r)),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => cubit.changeBotooms3(),
                            child: Container(
                              width: 155.w,
                              height: 50.h,
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: kB2 == 1
                                          ? Image.asset(
                                              'assets/images/true-circle.png',
                                              color: Colors.white,
                                            )
                                          : Image.asset(
                                              'assets/images/true-circle1.png',
                                            )

                                      //  ? Colors.white
                                      //  : Colors.green,

                                      ),
                                  SizedBox(
                                    width: 80.w,
                                  ),
                                  Text(
                                    'نعم',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: kB2 == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: kB2 == 1 ? Colors.green : Colors.white,
                                  borderRadius: BorderRadius.circular(15.r)),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 15.h,
                    ),
                    const SpaceLine(),
                    SizedBox(
                      height: 25.h,
                    ),
                    // Text(
                    //   'يرجى اختيار نوع التسريب ادناه',
                    //   style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // const BuildBottomContainer(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 160.w),
                      child: Text(
                        'يرجى وصف المشكلة ادناه',
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        width: double.infinity, // <-- TextField width
                        height: 175.h, // <-- TextField height
                        child: TextFormField(
                          controller: descriptionController,
                          maxLines: null,
                          expands: true,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'اوصف المشكله بوضوح',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 160.w),
                      child: Text(
                        'يرجى تحديد مكان المشكلة',
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),

                    //!----------------------------------------------

                    kPlacemarks != null
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Container(
                              width: double.infinity,
                              height: 160.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                              ),
                              child: Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.h),
                                      child: Container(
                                        width: 297.w,
                                        height: 47.h,
                                        decoration: BoxDecoration(
                                            color: HexColor('#E9F0FF'),
                                            borderRadius:
                                                BorderRadius.circular(15.r)),
                                        child: Row(children: [
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          Text(
                                            '${kPlacemarks![0].locality!}،${kPlacemarks![0].country!}',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                          ),
                                        ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.h),
                                      child: Container(
                                        width: 297.w,
                                        height: 47.h,
                                        decoration: BoxDecoration(
                                            color: HexColor('#E9F0FF'),
                                            borderRadius:
                                                BorderRadius.circular(15.r)),
                                        child: Row(children: [
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          Text(
                                            '${kPlacemarks![0].street!}،${kPlacemarks![0].administrativeArea!}',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                          ),
                                        ]),
                                      ),
                                    )
                                  ]),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: InkWell(
                              onTap: () => cubit.checkLocationPermission(
                                  context: context),
                              child: Container(
                                width: double.infinity,
                                height: 160.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white,
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Text(
                                        'اضغط لتحديد الموقع',
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold),
                                      ))
                                    ]),
                              ),
                            ),
                          ),
                    //!----------------------------------------------

                    SizedBox(
                      height: 20.h,
                    ),
                    kPickedImage == null
                        ? InkWell(
                            onTap: () async {
                              kProblem = descriptionController.text;
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialogFb1(
                                          title: "تنبيه",
                                          description: "يرجي تحديد مصدر الصوره",
                                          actions: [
                                            TextButton(
                                              onPressed: () async {
                                                await cubit
                                                    .pickImageFromCamera();
                                              },
                                              child: Text('الكاميرا'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await cubit
                                                    .pickImageFromGallery();
                                              },
                                              child: Text('معرض الصور'),
                                            ),
                                          ]));
                            },
                            child: SvgPicture.asset('assets/images/upload.svg'),
                            //const Image(
                              // image: AssetImage(
                              //   'assets/images/upload.png',
                              // ),
                           // ),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Image.file(
                                  kPickedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    kPickedImage = null;
                                    context.read<ProfileCubit>().getUser();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45.w),
                      child: DefaultButton(
                        onPressed: () {
                          cubit.sendReport(
                            kPickedImage!,
                            //! title is empty
                            //titleController.text,
                            'test',
                            descriptionController.text,
                            '${kC1!.latitude} / ${kC1!.latitude}',
                            kB1 == 1
                                ? true
                                : kB1 == 2
                                    ? false
                                    : false,
                            kB2 == 1
                                ? true
                                : kB2 == 2
                                    ? false
                                    : false,
                          );
                        },
                        childText: 'ارسال بلاغ',
                        color: Colors.white,
                        textColor: const Color(0xFF2BB9D8),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
