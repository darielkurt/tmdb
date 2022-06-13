import 'package:get/get.dart';

const String apiKey = 'e70a150e6a73bd0b43a94faf1b202301';
const String apiKeyQuery = '?api_key=$apiKey';

class MovieService extends GetConnect {
  Future<Response> fetchMovieList() async => await httpClient
      .get('https://api.themoviedb.org/3/movie/popular$apiKeyQuery');

  Future<Response> fetchMovieById(int? id) async => await httpClient
      .get('https://api.themoviedb.org/3/movie/$id$apiKeyQuery');
}
