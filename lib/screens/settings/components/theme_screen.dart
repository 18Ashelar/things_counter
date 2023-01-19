import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: const Text("Theme"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.light_mode_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                "Light",
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                    fontSize: 16.sp),
              ),
              trailing: Icon(
                Icons.check,
                size: 20.sp,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
           const SizedBox(height: 10.0,),
            ListTile(
              leading: Icon(
                Icons.dark_mode_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                "Dark",
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                    fontSize: 16.sp),
              ),
              trailing: Icon(
                Icons.check,
                size: 20.sp,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
