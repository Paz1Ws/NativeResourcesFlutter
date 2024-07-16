
import 'package:myapp/infrastructure/datasources/pokemon_dt_impl.dart';

import '../../domain/domain.dart';
import '../../domain/repositories/pokemon_rpty.dart';



class PokemonsRepositoryImpl implements PokemonRepository {

  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl({ PokemonsDatasource? datasource })
    : datasource = datasource ?? PokemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return datasource.getPokemon(id);
  }

}
