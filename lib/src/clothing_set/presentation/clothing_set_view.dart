import 'package:snap_look/src/clothing_set/models/clothing_set.dart';
import '../../../shared/enums/item_type.dart';
import '../models/item.dart';

class ClothingSetView {
  ClothingSetView(String id);
  ClothingSet clothingSet = ClothingSet(
    id: '2',
    name: 'Casual Comfort',
    imagePath: 'assets/images/4.jpeg',
    price: 800,
    gender: Gender.boy,
    style: Style.casual,
    items: [
      Item(id: '5', name: 'Hoodie', brand: 'Adidas', type: ItemType.jacket, price: 200, canRemoveFromSet: false),
      Item(id: '6', name: 'Jogger Pants', brand: 'Puma', type: ItemType.pants, price: 250, canRemoveFromSet: true),
      Item(id: '7', name: 'Slip-on Shoes', brand: 'Vans', type: ItemType.shoes, price: 350, canRemoveFromSet: true),
    ],
  );
}
