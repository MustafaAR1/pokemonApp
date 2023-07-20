import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_app_sastaticket/model/pokemon_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonCubit extends Cubit<List<PokemonModel>> {
  PokemonCubit() : super([]);
  List<Pokemon> favorites = [];

  void addToFavorites(Pokemon pokemon) {
    favorites.add(pokemon);
  }

  void removeFromFavorites(Pokemon pokemon) {
    favorites.remove(pokemon);
  }

  Future<void> loadFavoritesFromSharedPreferences() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final favoritesJson = preferences.getString('favorites');
      if (favoritesJson != null) {
        final favoritesList = List<Pokemon>.from(json
            .decode(favoritesJson)
            .map((pokemonJson) => Pokemon.fromJson(pokemonJson)));
        favorites = favoritesList;
      }
    } catch (error) {
      // Handle error case
    }
  }

  Future<void> saveFavoritesToSharedPreferences() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final favoritesJson =
          json.encode(favorites.map((pokemon) => pokemon).toList());
      await preferences.setString('favorites', favoritesJson);
    } catch (error) {
      // Handle error case
    }
  }

  Future<void> fetchPokemonList() async {
    try {
      final response =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final pokemonList = List<PokemonModel>.from(jsonData['results']
            .map((pokemonJson) => PokemonModel.fromJson(pokemonJson)));
        emit(pokemonList);
      } else {}
    } catch (error) {}
  }
}
