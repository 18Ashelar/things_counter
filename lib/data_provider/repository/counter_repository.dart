import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:things_counter/constants/constants.dart';
import 'package:things_counter/data_provider/models/counter/counter_details.dart';

class CounterRepository extends ChangeNotifier {
  List<CounterDetails> _counterDetails = [];

  // Create new note
  Future<void> createItem(CounterDetails counterDetails) async {
    Box<CounterDetails> box = await Hive.openBox<CounterDetails>(kHiveBoxName);
    await box.add(counterDetails);
    _counterDetails.add(counterDetails);
    log("First ${_counterDetails.toString()}");
    _counterDetails = box.values.toList();
    log("Secound ${_counterDetails.length}");
    notifyListeners();
  }

  // Get notes
  Future<void> getItems() async {
    Box<CounterDetails> box = await Hive.openBox<CounterDetails>(kHiveBoxName);
    _counterDetails = box.values.toList();
    notifyListeners();
  }

  // method to increase counter value
  Future<void> increaseCounterValue(int counterId, int counterValue) async {
    Box<CounterDetails> box = await Hive.openBox<CounterDetails>(kHiveBoxName);

    final counterDetails =
        box.values.firstWhere((element) => element.id == counterId);
    counterDetails.counterValue =
        counterDetails.counterValue + counterDetails.incrementBy;
    counterDetails.save();
    notifyListeners();
  }

  // method to decrease counter value
  Future<void> decreaseCounterValue(int counterId, int counterValue) async {
    Box<CounterDetails> box = await Hive.openBox<CounterDetails>(kHiveBoxName);

    final counterDetails =
        box.values.firstWhere((element) => element.id == counterId);
    int decrementValue =
        counterDetails.counterValue - counterDetails.decrementBy;
    counterDetails.counterValue = decrementValue < 0 ? 0 : decrementValue;

    counterDetails.save();
    notifyListeners();
  }

  // method to decrease counter value
  Future<void> resetCounterValue(int counterId) async {
    Box<CounterDetails> box = await Hive.openBox<CounterDetails>(kHiveBoxName);

    final counterDetails =
        box.values.firstWhere((element) => element.id == counterId);
    if (counterDetails.counterValue >= counterDetails.resetBy) {
      counterDetails.counterValue = counterDetails.resetBy;

      counterDetails.save();
      notifyListeners();
    }
  }

  List<CounterDetails> get() => _counterDetails;
}
