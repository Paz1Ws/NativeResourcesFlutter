import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/domain/entities/pokemon.dart';
import 'package:myapp/workmanager/callback_dispatcher.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/background/background_fetch_provider.dart';
import '../../providers/pokemon/db_pokemon_provider.dart';

class DbPokemonsScreen extends ConsumerWidget {
  const DbPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonsAsync = ref.watch(pokemonDbProvider);
    final isBackgroundFetchActive = ref.watch(backgroundPokemonFetchProvider);

    if (pokemonsAsync.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final List<Pokemon> pokemons = pokemonsAsync.value ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Process'),
        actions: [
          IconButton(
              onPressed: () {
                Workmanager().registerOneOffTask(
                    fetchBackgroundTaskKey, fetchBackgroundTaskKey,
                    initialDelay: const Duration(seconds: 3),
                    inputData: {'howMany': 30});
              },
              icon: const Icon(Icons.add_alarm_sharp))
        ],
      ),
      body: Column(
        children: [
          Text(
            "Note: Add pokemons from Pokemons Screen, and see them here",
            textAlign: TextAlign.center,
            style: GoogleFonts.acme(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomScrollView(
            shrinkWrap: true,
            slivers: [
              _PokemonsGrid(pokemons: pokemons),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Activar o desactivar una tarea periódica
          ref.read(backgroundPokemonFetchProvider.notifier).toggleProcess();
        },
        label: (isBackgroundFetchActive == true)
            ? const Text('Disable Background')
            : const Text('Unable to fetch data'),
        icon: const Icon(Icons.av_timer),
      ),
    );
  }
}

class _PokemonsGrid extends StatelessWidget {
  final List<Pokemon> pokemons;

  const _PokemonsGrid({required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];

        return Column(
          children: [
            Image.network(
              pokemon.spriteFront,
              fit: BoxFit.contain,
            ),
            Text(pokemon.name + ' #' + pokemon.id.toString()),
          ],
        );
      },
    );
  }
}
