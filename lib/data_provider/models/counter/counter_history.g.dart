// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CounterHistoryAdapter extends TypeAdapter<CounterHistory> {
  @override
  final int typeId = 3;

  @override
  CounterHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterHistory(
      counterValue: fields[1] as int,
      createdAt: fields[3] as String,
      lastResetOn: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CounterHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.counterValue)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.lastResetOn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
