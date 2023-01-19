import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'components/theme_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: const Text("Settings"),
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
            SettingsItem(
              title: "Theme",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const ThemeScreen();
                })));
              },
              icon: Icons.light_mode_outlined,
            ),
            const SizedBox(
              height: 10.0,
            ),
            SettingsItem(
              title: "Backup",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const ThemeScreen();
                })));
              },
              icon: Icons.backup_outlined,
            ),
            const SizedBox(
              height: 10.0,
            ),
            SettingsItem(
              title: "Sound",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const ThemeScreen();
                })));
              },
              icon: Icons.audiotrack_outlined,
            ),
            const SizedBox(
              height: 10.0,
            ),
            SettingsItem(
              title: "About",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const ThemeScreen();
                })));
              },
              icon: Icons.info_outline,
            )
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {Key? key, required this.icon, required this.onTap, required this.title})
      : super(key: key);

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
            fontSize: 16.sp),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16.sp,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
      ),
    );
  }
}
