import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sahem_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:sahem_app/helper/constants/strings.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        //var img = cubit.pickedImage!;
        return Scaffold(
          backgroundColor: HexColor('#060E11'),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
            title: const Text('التقط صورة'),
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Container(
                child: kPickedImage == null
                    ? Center(
                        child: Text(
                        'No image selected.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                    : Image.file(
                        kPickedImage!,
                        fit: BoxFit.cover,
                      ),
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            //Center(child: Image.asset('assets/images/street.png')),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r)),
                    width: 162.w,
                    height: 50.h,
                    child: MaterialButton(
                        child: Text(
                          'الغاء',
                          style: TextStyle(color: Colors.red, fontSize: 18.sp),
                        ),
                        onPressed: () {
                          kPickedImage = null;
                          //Navigator.pop(context);
                          Navigator.pop(context, );
                        }),
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Container(
                    width: 162.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: MaterialButton(
                        child: Text(
                          'ارسال',
                          style: TextStyle(
                              color: HexColor('#2BB9D8'), fontSize: 18.sp),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                )
              ],
            ),
          ]),
        );
      },
    );
  }
}
