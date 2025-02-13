import 'package:snap_look/config/injector.dart';
import 'package:snap_look/src/clothing_set/models/clothing_set.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../../clothing_set/repositories/clothing_set_repository.dart';

class ExploreView {
  final clothingSetRepository = injector<ClothingSetRepository>();
  List<ClothingSet> sets = [];
  late Command0 loadSets;

  ExploreView() {
    loadSets = Command0(_loadSets)..execute();
  }

  Future<Result> _loadSets() async {
    final result = await clothingSetRepository.getAll();
    if (result is Ok) sets = result.asOk.value;
    return result;
  }
}
