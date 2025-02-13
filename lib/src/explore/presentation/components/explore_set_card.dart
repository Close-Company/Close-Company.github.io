import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snap_look/src/clothing_set/models/clothing_set.dart';

class ExploreSetCard extends StatefulWidget {
  final ClothingSet clothingSet;
  const ExploreSetCard({super.key, required this.clothingSet});

  @override
  State<ExploreSetCard> createState() => _ExploreSetCardState();
}

class _ExploreSetCardState extends State<ExploreSetCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            _buildItemTypes(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.clothingSet.name,
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis, // Caso o texto ultrapasse, será truncado
                          ),
                          Text(
                            widget.clothingSet.style.name,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis, // Caso o texto ultrapasse, será truncado
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Imagem do conjunto (ajustada para não quebrar layout)
                Expanded(child: Image.asset(widget.clothingSet.imagePath)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      child: Text(
                        'R\$',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Text(
                      NumberFormat('#,##0', 'pt_BR').format(widget.clothingSet.price / 100), // Divisão para valores em centavos, se necessário
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildItemTypes() {
    return SizedBox(
      width: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Centraliza os itens verticalmente
        children: [
          for (var item in widget.clothingSet.items) // Itera pelos itens sem ListView
            Card(
              elevation: 0,
              color: Colors.black12,
              shape: CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset('assets/images/${item.type.name}.png'),
              ),
            ),
        ],
      ),
    );
  }
}
