// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';
part 'counter_history.g.dart';

@HiveType(typeId: 3)
class CounterHistory extends HiveObject {

  @HiveField(1)
  int counterValue;

  @HiveField(3)
  String createdAt;

  @HiveField(4)
  String lastResetOn;
  CounterHistory({
    required this.counterValue,
    required this.createdAt,
    required this.lastResetOn,
  });

  CounterHistory copyWith({
    int? counterValue,
    String? createdAt,
    String? lastResetOn,
  }) {
    return CounterHistory(
    counterValue: counterValue ?? this.counterValue,
      createdAt: createdAt ?? this.createdAt,
      lastResetOn: lastResetOn ?? this.lastResetOn,
    );
  }

  @override
  String toString() {
    return 'CounterHistory( counterValue: $counterValue, createdAt: $createdAt, lastResetOn: $lastResetOn)';
  }
}
