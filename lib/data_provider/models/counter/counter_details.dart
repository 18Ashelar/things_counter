// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

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
  
  CounterDetails({
    required this.id,
    required this.counterValue,
    required this.counterName,
    required this.createdAt,
    required this.incrementBy,
    required this.decrementBy,
    required this.resetBy,
    required this.colorDetails,
  });


 


  @override
  String toString() {
    return 'CounterDetails(id: $id, counterValue: $counterValue, counterName: $counterName, createdAt: $createdAt, incrementBy: $incrementBy, decrementBy: $decrementBy, resetBy: $resetBy, colorDetails: $colorDetails)';
  }
}
