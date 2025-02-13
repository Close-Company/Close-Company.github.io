import 'item.dart';

class ClothingSet {
  final String id;
  final String imagePath;
  final String name;
  final int price;
  final Gender gender;
  final Style style;
  final List<Item> items;

  ClothingSet({required this.id, required this.name, required this.imagePath, required this.price, required this.gender, required this.style, required this.items});

  int get totalItems => items.length;
}

enum Gender { man, woman, girl, boy }

enum Style { casual, formal, sporty, streetwear, classic }
