import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class PokeApi {

  var pokeID;
  var pokeSpecies;

  PokeApi({
    @required
    this.pokeID
  });

  fetchPokeData() {
    final url = 'https://pokeapi.co/api/v2/pokemon/$pokeID/';
    final res = http.get(url);

    return res;
  }

  fetchPokeSpecies() {
    final url = 'https://pokeapi.co/api/v2/pokemon-species/$pokeID/';
    final res = http.get(url);

    return res;
  }

}