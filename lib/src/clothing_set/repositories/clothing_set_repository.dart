import 'package:snap_look/src/clothing_set/models/clothing_set.dart';
import 'package:snap_look/src/clothing_set/models/item.dart';

import '../../../shared/enums/item_type.dart';
import '../../../utils/result.dart';

abstract class ClothingSetRepository {
  Future<Result<List<ClothingSet>>> getAll({Gender? gender, Style? style, int limit = 10, int offset = 0});
  Future<Result<ClothingSet>> getById(String id);
}

class ClothingSetRepositoryFake implements ClothingSetRepository {
  List<ClothingSet> sets = [
    ClothingSet(
      id: '1',
      name: 'Urban Explorer',
      imagePath: 'assets/images/1.jpeg',
      price: 120000,
      gender: Gender.boy,
      style: Style.casual,
      items: [
        Item(id: '1', name: 'Denim Jacket', brand: 'Levi\'s', type: ItemType.jacket, price: 250, canRemoveFromSet: false),
        Item(id: '2', name: 'White T-Shirt', brand: 'H&M', type: ItemType.shirt, price: 50, canRemoveFromSet: true),
        Item(id: '3', name: 'Black Jeans', brand: 'Zara', type: ItemType.pants, price: 300, canRemoveFromSet: false),
        Item(id: '4', name: 'Sneakers', brand: 'Nike', type: ItemType.shoes, price: 600, canRemoveFromSet: true),
      ],
    ),
    ClothingSet(
      id: '2',
      name: 'Casual Comfort',
      imagePath: 'assets/images/2.jpeg',
      price: 80000,
      gender: Gender.boy,
      style: Style.casual,
      items: [
        Item(id: '5', name: 'Hoodie', brand: 'Adidas', type: ItemType.jacket, price: 200, canRemoveFromSet: false),
        Item(id: '6', name: 'Jogger Pants', brand: 'Puma', type: ItemType.pants, price: 250, canRemoveFromSet: true),
        Item(id: '7', name: 'Slip-on Shoes', brand: 'Vans', type: ItemType.shoes, price: 350, canRemoveFromSet: true),
      ],
    ),
    ClothingSet(
      id: '4',
      name: 'Smart Casual',
      imagePath: 'assets/images/4.jpeg',
      price: 150029,
      gender: Gender.boy,
      style: Style.casual,
      items: [
        Item(id: '8', name: 'Blazer', brand: 'Hugo Boss', type: ItemType.jacket, price: 700, canRemoveFromSet: false),
        Item(id: '9', name: 'Button-up Shirt', brand: 'Ralph Lauren', type: ItemType.shirt, price: 350, canRemoveFromSet: true),
        Item(id: '10', name: 'Chinos', brand: 'Tommy Hilfiger', type: ItemType.pants, price: 450, canRemoveFromSet: true),
      ],
    ),
    ClothingSet(
      id: '5',
      name: 'Summer Breeze',
      imagePath: 'assets/images/5.jpeg',
      price: 60000,
      gender: Gender.boy,
      style: Style.casual,
      items: [
        Item(id: '11', name: 'Linen Shirt', brand: 'Zara', type: ItemType.shirt, price: 200, canRemoveFromSet: true),
        Item(id: '12', name: 'Shorts', brand: 'H&M', type: ItemType.pants, price: 150, canRemoveFromSet: true),
        Item(id: '13', name: 'Espadrilles', brand: 'Toms', type: ItemType.shoes, price: 250, canRemoveFromSet: true),
      ],
    ),
    ClothingSet(
      id: '6',
      name: 'Streetwear Hype',
      imagePath: 'assets/images/6.jpeg',
      price: 180000,
      gender: Gender.boy,
      style: Style.casual,
      items: [
        Item(id: '14', name: 'Graphic Hoodie', brand: 'Supreme', type: ItemType.jacket, price: 800, canRemoveFromSet: false),
        Item(id: '15', name: 'Cargo Pants', brand: 'Off-White', type: ItemType.pants, price: 600, canRemoveFromSet: true),
        Item(id: '16', name: 'High-top Sneakers', brand: 'Jordan', type: ItemType.shoes, price: 400, canRemoveFromSet: true),
      ],
    ),
    ClothingSet(
      id: '7',
      name: 'Business Formal',
      imagePath: 'assets/images/7.jpeg',
      price: 250000,
      gender: Gender.boy,
      style: Style.casual,
      items: [
        Item(id: '17', name: 'Tailored Suit', brand: 'Armani', type: ItemType.jacket, price: 1500, canRemoveFromSet: false),
        Item(id: '18', name: 'Dress Shirt', brand: 'Brooks Brothers', type: ItemType.shirt, price: 400, canRemoveFromSet: true),
        Item(id: '19', name: 'Leather Oxford Shoes', brand: 'Gucci', type: ItemType.shoes, price: 600, canRemoveFromSet: false),
      ],
    ),
  ];
  @override
  Future<Result<List<ClothingSet>>> getAll({
    Gender? gender,
    Style? style,
    int limit = 10,
    int offset = 0,
  }) async {
    return Result.ok(sets);
  }

  @override
  Future<Result<ClothingSet>> getById(String id) async {
    return Result.ok(sets.firstWhere((e) => e.id == id));
  }
}
