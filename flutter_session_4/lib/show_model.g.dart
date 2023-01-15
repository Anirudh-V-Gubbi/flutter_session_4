// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShowModelAdapter extends TypeAdapter<ShowModel> {
  @override
  final int typeId = 1;

  @override
  ShowModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShowModel(
      title: fields[0] as String,
      fullTitle: fields[1] as String,
      isFavourite: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ShowModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.fullTitle)
      ..writeByte(2)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
