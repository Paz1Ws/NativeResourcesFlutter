import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/domain.dart';
import '../../../domain/repositories/pokemon_rpty.dart';
import '../../../infrastructure/repositories/pokemon_rpty_impl.dart';


final pokemonsRepositoryProvider = Provider<PokemonRepository>((ref) {
  return PokemonsRepositoryImpl();
});



final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {

  final pokemonRepository = ref.watch( pokemonsRepositoryProvider );

  final ( pokemon, error ) = await pokemonRepository.getPokemon(id);

  if ( pokemon != null ) return pokemon;

  throw error;
});