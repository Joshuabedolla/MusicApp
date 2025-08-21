import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 1)
class FavoriteSong extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String artist;

  FavoriteSong({required this.title, required this.artist});
}

@HiveType(typeId: 2)
class FavoriteArtist extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String country;

  FavoriteArtist({required this.name, required this.country});
}
