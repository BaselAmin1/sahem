import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Card customCard(
  dynamic label,
  ImageProvider iconWidget,
) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 30.h),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.sp),
    ),
    elevation: 10,
    child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15.sp),
            )),
        height: 130.h,
        width: 100.w,
        child: Column(
          children: [
            Image(
              image: iconWidget,
              height: 90.h,
            ),
            Text(label)
          ],
        )),
  );
}
