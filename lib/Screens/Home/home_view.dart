import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_sastaticket/Screens/Home/home_cubit.dart';

import '../../model/pokemon_model.dart';

class PokemonGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, List<PokemonModel>>(
      builder: (context, pokemonList) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: pokemonList.length,
          itemBuilder: (context, index) {
            final PokemonModel pokemon = pokemonList[index];
            final isFavorite = PokemonCubit().favorites.contains(pokemon);

            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display Pokemon image or other details
                  Text(pokemon.results[index].name),
                  Text(pokemon.results[index].url),

                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      final pokemonCubit = context
                          .read<PokemonCubit>(); // Get PokemonCubit instance
                      if (isFavorite) {
                        pokemonCubit
                            .removeFromFavorites(pokemon.results[index]);
                      } else {
                        pokemonCubit.addToFavorites(pokemon.results[index]);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
