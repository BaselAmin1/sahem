import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildBottomContainer extends StatefulWidget {
  const BuildBottomContainer({
    super.key,
  });

  @override
  State<BuildBottomContainer> createState() => _BuildBottomContainerState();
}

class _BuildBottomContainerState extends State<BuildBottomContainer> {
  int val1 = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: double.infinity,
        height: 300.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () => setState(() {
                val1 = 1;
              }),
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Container(
                  width: 312.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey[200],
                      boxShadow: [BoxShadow(color: HexColor('#F6FAFF'))]),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 120.w),
                      child: Text(
                        'تسريب ماسورة',
                        style: TextStyle(
                            fontWeight: val1 == 1
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      val1 == 1
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      color: val1 == 1 ? Colors.blue : Colors.grey,
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () => setState(() {
                val1 = 2;
              }),
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Container(
                  width: 312.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey[200],
                      boxShadow: [BoxShadow(color: HexColor('#F6FAFF'))]),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 120.w),
                      child: Text(
                        'تسريب ماسورة',
                        style: TextStyle(
                            fontWeight: val1 == 2
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      val1 == 2
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      color: val1 == 2 ? Colors.blue : Colors.grey,
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () => setState(() {
                val1 = 3;
              }),
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Container(
                  width: 312.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey[200],
                      boxShadow: [BoxShadow(color: HexColor('#F6FAFF'))]),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 120.w),
                      child: Text(
                        'تسريب ماسورة',
                        style: TextStyle(
                            fontWeight: val1 == 3
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      val1 == 3
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      color: val1 == 3 ? Colors.blue : Colors.grey,
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () => setState(() {
                val1 = 4;
              }),
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Container(
                  width: 312.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey[200],
                      boxShadow: [BoxShadow(color: HexColor('#F6FAFF'))]),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 120.w),
                      child: Text(
                        'تسريب ماسورة',
                        style: TextStyle(
                            fontWeight: val1 == 4
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      val1 == 4
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      color: val1 == 4 ? Colors.blue : Colors.grey,
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () => setState(() {
                val1 = 5;
              }),
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Container(
                  width: 312.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey[200],
                      boxShadow: [BoxShadow(color: HexColor('#F6FAFF'))]),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 120.w),
                      child: Text(
                        'تسريب ماسورة',
                        style: TextStyle(
                            fontWeight: val1 == 5
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      val1 == 5
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      color: val1 == 5 ? Colors.blue : Colors.grey,
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
