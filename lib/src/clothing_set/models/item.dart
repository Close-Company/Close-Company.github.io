import '../../../shared/enums/item_type.dart';

class Item {
  String id;
  String name;
  int price;
  String brand;
  ItemType type;
  bool canRemoveFromSet;
  List availableColors;
  Item({
    required this.id,
    required this.name,
    required this.brand,
    required this.type,
    required this.price,
    required this.canRemoveFromSet,
    this.availableColors = const [],
  });
}
