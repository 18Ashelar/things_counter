import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {Key? key, required this.title, required this.onTap, this.width})
      : super(key: key);

  final String title;
  final Function onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: 47,
        child: ElevatedButton(
            onPressed: () {
              onTap();
            },
            child: Text(title)));
  }
}
