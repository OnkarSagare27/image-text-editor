import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: OutlinedButton(
        onPressed: () {},
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
