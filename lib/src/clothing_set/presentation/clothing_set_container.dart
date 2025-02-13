import 'package:flutter/material.dart';
import 'package:snap_look/src/clothing_set/models/item.dart';
import 'package:snap_look/shared/app_container.dart';
import '../../../shared/enums/item_type.dart';
import 'clothing_set_view.dart';

class ClothingSetPage extends StatefulWidget {
  final String clothingSetId;
  const ClothingSetPage({super.key, required this.clothingSetId});

  @override
  State<ClothingSetPage> createState() => _ClothingSetPageState();
}

class _ClothingSetPageState extends State<ClothingSetPage> {
  late final view = ClothingSetView(widget.clothingSetId);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return AppContainer(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: screenWidth * 0.45,
      width: screenWidth * 0.65,
      child: Column(
        children: [
          SizedBox(
            height: 35,
            width: double.infinity,
            child: Row(
              children: [Text('Masculino Adulto', style: Theme.of(context).textTheme.titleLarge)],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildIndividualItemsSection(Item(brand: 'rayban', canRemoveFromSet: true, id: 'id', name: 'Ocolus rift', type: ItemType.glasses, price: 1000))),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [Expanded(child: _buildOutfitModel()), FilledButton(onPressed: () {}, child: Text('Comprar'))],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutfitModel() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset(view.clothingSet.imagePath),
    );
  }

  Widget _buildIndividualItemsSection(Item item) {
    return GridView.builder(
        itemCount: view.clothingSet.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, idx) {
          Item item = view.clothingSet.items[idx];
          return SizedBox(
            height: 180,
            width: 120,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Icon(
                          Icons.check_circle,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                    Text(
                      item.brand,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Expanded(child: Image.asset('assets/images/oculos.jpeg')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('R\$${item.price.toString()}', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
