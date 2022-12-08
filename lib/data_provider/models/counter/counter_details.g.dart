// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CounterDetailsAdapter extends TypeAdapter<CounterDetails> {
  @override
  final int typeId = 0;

  @override
  CounterDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterDetails(
      id: fields[0] as int,
      counterValue: fields[1] as int,
      counterName: fields[2] as String,
      createdAt: fields[3] as String,
      incrementBy: fields[4] as int,
      decrementBy: fields[5] as int,
      resetBy: fields[6] as int,
      colorDetails: fields[7] as CounterColorDetails,
    );
  }

  @override
  void write(BinaryWriter writer, CounterDetails obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.counterValue)
      ..writeByte(2)
      ..write(obj.counterName)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.incrementBy)
      ..writeByte(5)
      ..write(obj.decrementBy)
      ..writeByte(6)
      ..write(obj.resetBy)
      ..writeByte(7)
      ..write(obj.colorDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
