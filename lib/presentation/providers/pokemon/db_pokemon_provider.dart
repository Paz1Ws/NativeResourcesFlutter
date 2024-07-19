
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/infrastructure/repositories/isar_localdb_rpty_impl.dart';
import '../../../domain/domain.dart';


final pokemonDbProvider = FutureProvider.autoDispose<List<Pokemon>>((ref) async {

  final localDb = LocalDbRepositoryImpl();
  final pokemons = await localDb.loadPokemons();

  return pokemons;
});
