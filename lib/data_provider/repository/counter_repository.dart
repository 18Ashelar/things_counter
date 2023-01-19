import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:things_counter/constants/constants.dart';
import 'package:things_counter/data_provider/models/counter/counter_details.dart';

class CounterRepository extends ChangeNotifier {
  List<CounterDetails> _counterDetails = [];

  //counter position change
  Future<void> changePosition(int oldIndex, int newIndex) async {
    Box<CounterDetails> box = await Hive.openBox<CounterDetails>(kHiveBoxName);

    final element = _counterDetails.removeAt(oldIndex);
    _counterDetails.insert(newIndex, element);
    await box.clear();
    final c = _counterDetails;
    for (var element in c) {
      box.add(element.copyWith());
    }
    log(c.toString());
    _counterDetails.clear();
    notifyListeners();
  }

  // Create new note
  Future<void> createItem(CounterDetails counterDetails) async {
    Box<CounterDetails> box = await Hive.openBox<CounterDetails>(kHiveBoxName);
    await box.add(counterDetails);
    _counterDetails.add(counterDetails);
    log("First ${_counterDetails.toString()}");
    _counterDetails = box.values.toList();
    log("Seconds ${_counterDetails.length}");
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
    if (counterDetails.counterValue < 999999) {
      counterDetails.counterValue =
          counterDetails.counterValue + counterDetails.incrementBy;
      counterDetails.save();
    }
    else{
      log("Number is very large");
    }

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
    // if (counterDetails.counterValue >= counterDetails.resetBy) {
    counterDetails.counterValue = counterDetails.resetBy;

    counterDetails.save();
    notifyListeners();
    // }
  }

  //Deleting product from local cart
  Future<void> deleteCounter(int counterId) async {
    Box<CounterDetails> box = await Hive.openBox<CounterDetails>(kHiveBoxName);

    final counterDetails =
        box.values.firstWhere((element) => element.id == counterId);
    //  print(taskToRemove);
    await counterDetails
        .delete()
        .then((value) => _counterDetails = box.values.toList());

    notifyListeners();
  }

  //reset all counter value
  Future<void> resetAllCounter() async {
    Box<CounterDetails> box = await Hive.openBox<CounterDetails>(kHiveBoxName);

    for (var element in _counterDetails) {
      final counterDetails =
          box.values.firstWhere((element1) => element1.id == element.id);
      // if (counterDetails.counterValue >= counterDetails.resetBy) {
      counterDetails.counterValue = counterDetails.resetBy;

      counterDetails.save();
    }

    notifyListeners();
  }

  List<CounterDetails> get() => _counterDetails;
}
