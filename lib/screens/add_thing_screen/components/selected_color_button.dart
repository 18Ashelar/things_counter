import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectedColorButton extends StatelessWidget {
  const SelectedColorButton(
      {Key? key,
      required this.colorName,
      required this.onTap,
      required this.title})
      : super(key: key);

  final Color colorName;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 110,
      child: OutlinedButton(
          onPressed: () {
            onTap();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            child: Column(
              children: [
                Container(
                  height: 6.h,
                  width: 6.h,
                  decoration: BoxDecoration(
                      color: colorName,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.outline)),
                ),
                const SizedBox(height: 5.0),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          )),
    );
  }
}
