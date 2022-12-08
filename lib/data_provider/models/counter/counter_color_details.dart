// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'counter_color_details.g.dart';

@HiveType(typeId: 1)
class CounterColorDetails {
  @HiveField(0)
  String backgroundColor;

  @HiveField(1)
  String textColor;

  @HiveField(2)
  String buttonColor;

  @HiveField(3)
  String buttonIcon;
  
  CounterColorDetails({
    required this.backgroundColor,
    required this.textColor,
    required this.buttonColor,
    required this.buttonIcon,
  });

  @override
  String toString() {
    return 'CounterColorDetails(backgroundColor: $backgroundColor, textColor: $textColor, buttonColor: $buttonColor, buttonIcon: $buttonIcon)';
  }
}
