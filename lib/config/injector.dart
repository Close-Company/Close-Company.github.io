import 'package:get_it/get_it.dart';
import '../src/clothing_set/repositories/clothing_set_repository.dart';

final injector = GetItInjector();

abstract class Injector {
  void replace<T extends Object, U extends T>(U instance);
  T get<T extends Object>();
  T call<T extends Object>();
}

class GetItInjector implements Injector {
  final GetIt _getIt = GetIt.instance;

  Future<void> register() async {
    try {
      _getIt.registerLazySingleton<ClothingSetRepository>(() => ClothingSetRepositoryFake());
    } catch (e) {
      print('Error on register: $e');
    }
  }

  @override
  T get<T extends Object>() {
    return _getIt.get<T>();
  }

  @override
  void replace<T extends Object, U extends T>(U instance) {
    _getIt.unregister<T>();
    _getIt.registerSingleton<T>(instance);
  }

  @override
  T call<T extends Object>() {
    return _getIt.get<T>();
  }
}
