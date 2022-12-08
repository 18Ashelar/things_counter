// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_color_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CounterColorDetailsAdapter extends TypeAdapter<CounterColorDetails> {
  @override
  final int typeId = 1;

  @override
  CounterColorDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterColorDetails(
      backgroundColor: fields[0] as String,
      textColor: fields[1] as String,
      buttonColor: fields[2] as String,
      buttonIcon: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CounterColorDetails obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.backgroundColor)
      ..writeByte(1)
      ..write(obj.textColor)
      ..writeByte(2)
      ..write(obj.buttonColor)
      ..writeByte(3)
      ..write(obj.buttonIcon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterColorDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
