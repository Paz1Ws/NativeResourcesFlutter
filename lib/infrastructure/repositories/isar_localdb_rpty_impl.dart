import 'package:myapp/domain/datasource/local_db_pokemon_dt.dart';
import 'package:myapp/domain/entities/pokemon.dart';
import 'package:myapp/domain/repositories/local_db_pokemon_rpty.dart';
import 'package:myapp/infrastructure/datasources/isar_localdb_dt_impl.dart';


class LocalDbRepositoryImpl extends LocalDbRepository {

  final LocalDbDatasource _datasource;


  LocalDbRepositoryImpl([ LocalDbDatasource? datasource ])
    : _datasource = datasource ?? IsarLocalDbDatasource();


  @override
  Future<void> insertPokemon(Pokemon pokemon) {
    return _datasource.insertPokemon(pokemon);
  }

  @override
  Future<List<Pokemon>> loadPokemons() {
    return _datasource.loadPokemons();
  }

  @override
  Future<int> pokemonCount() {
    return _datasource.pokemonCount();
  }

}