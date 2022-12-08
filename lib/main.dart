import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:things_counter/constants/custom_theme.dart';
import 'package:things_counter/data_provider/models/counter/counter_color_details.dart';
import 'package:things_counter/data_provider/repository/counter_repository.dart';
import 'package:things_counter/screens/home_screen/home_screen.dart';

import 'data_provider/models/counter/counter_details.dart';
import 'data_provider/repository/counter_card_color_set.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CounterColorDetailsAdapter());
  Hive.registerAdapter(CounterDetailsAdapter());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CustomTheme customTheme = CustomTheme();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterRepository()),
          ChangeNotifierProvider(create: (_) => CounterCardColorSet()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: customTheme.lightTheme(),
          home: const HomeScreen(),
        ),
      );
    });
  }
}
