import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.childText,
      required this.color,
      required this.textColor})
      : super(key: key);
  final Function onPressed;
  final String childText;
  final Color color;
  final Color textColor;

  @override
  State<DefaultButton> createState() => _DefaultButton();
}

class _DefaultButton extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 390.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp), color: widget.color),
      child: MaterialButton(
        onPressed: () => widget.onPressed(),
        child: Text(
          widget.childText,
          style: TextStyle(
              color: widget.textColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
