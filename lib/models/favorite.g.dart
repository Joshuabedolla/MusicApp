// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteSongAdapter extends TypeAdapter<FavoriteSong> {
  @override
  final int typeId = 1;

  @override
  FavoriteSong read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteSong(
      title: fields[0] as String,
      artist: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteSong obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.artist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteSongAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FavoriteArtistAdapter extends TypeAdapter<FavoriteArtist> {
  @override
  final int typeId = 2;

  @override
  FavoriteArtist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteArtist(
      name: fields[0] as String,
      country: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteArtist obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteArtistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
