// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:things_counter/data_provider/models/counter/counter_history.dart';

import 'counter_color_details.dart';

part 'counter_details.g.dart';

@HiveType(typeId: 0)
class CounterDetails extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int counterValue;
  @HiveField(2)
  String counterName;
  @HiveField(3)
  String createdAt;
  @HiveField(4)
  int incrementBy;
  @HiveField(5)
  int decrementBy;
  @HiveField(6)
  int resetBy;
  @HiveField(7)
  CounterColorDetails colorDetails;

  @HiveField(8)
  List<CounterHistory>? counterHistory;

  CounterDetails({
    required this.id,
    required this.counterValue,
    required this.counterName,
    required this.createdAt,
    required this.incrementBy,
    required this.decrementBy,
    required this.resetBy,
    required this.colorDetails,
    this.counterHistory,
  });

  CounterDetails copyWith({
    int? id,
    int? counterValue,
    String? counterName,
    String? createdAt,
    int? incrementBy,
    int? decrementBy,
    int? resetBy,
    CounterColorDetails? colorDetails,
    List<CounterHistory>? counterHistory,
  }) {
    return CounterDetails(
      id: id ?? this.id,
      counterValue: counterValue ?? this.counterValue,
      counterName: counterName ?? this.counterName,
      createdAt: createdAt ?? this.createdAt,
      incrementBy: incrementBy ?? this.incrementBy,
      decrementBy: decrementBy ?? this.decrementBy,
      resetBy: resetBy ?? this.resetBy,
      colorDetails: colorDetails ?? this.colorDetails,
      counterHistory: counterHistory ?? this.counterHistory,
    );
  }

  @override
  String toString() {
    return 'CounterDetails(id: $id, counterValue: $counterValue, counterName: $counterName, createdAt: $createdAt, incrementBy: $incrementBy, decrementBy: $decrementBy, resetBy: $resetBy, colorDetails: $colorDetails, counterHistory: $counterHistory)';
  }
}
