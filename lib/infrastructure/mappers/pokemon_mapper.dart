import 'package:myapp/infrastructure/models/pokemon_model_response.dart';

import '../../domain/entities/pokemon.dart';

class PokemonMapper {

  static Pokemon pokeApiPokemonToEntity( Map<String, dynamic> json ) {

    final pokeApiPokemon = PokeApiPokemonResponse.fromJson(json);

    return Pokemon(
      id: pokeApiPokemon.id, 
      name: pokeApiPokemon.name, 
      spriteFront: pokeApiPokemon.sprites.frontDefault
    );
  }

}