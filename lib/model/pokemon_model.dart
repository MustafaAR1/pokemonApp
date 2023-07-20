class PokemonModel {
  int count;
  String next;
  String previous;
  List<Pokemon> results;

  PokemonModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<Pokemon>.from(
          json['results'].map((result) => Pokemon.fromJson(result))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((pokemon) => pokemon.toJson()).toList(),
    };
  }
}

class Pokemon {
  String name;
  String url;

  Pokemon({
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
