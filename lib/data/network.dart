import 'dart:convert';

import 'package:movieflix/data/base_url.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<MovieModel> fetchNowMovies() async {
    final response = await http.get('${BaseUrl().url}now_playing?api_key=${BaseUrl().apikey}');

    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<MovieModel> fetchPopularMovies() async {
    final response = await http.get('${BaseUrl().url}popular?api_key=${BaseUrl().apikey}');

    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
