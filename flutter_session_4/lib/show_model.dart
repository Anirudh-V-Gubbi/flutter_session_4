import 'package:hive/hive.dart';

part 'show_model.g.dart';

@HiveType(typeId: 1)
class ShowModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String fullTitle;
  @HiveField(2)
  final bool isFavourite;

  ShowModel({required this.title, required this.fullTitle, required this.isFavourite});
}