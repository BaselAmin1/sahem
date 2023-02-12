import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceLine extends StatelessWidget {
  const SpaceLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 1.h,
      color: Colors.white,
    );
  }
}