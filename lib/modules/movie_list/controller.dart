import 'package:get/get.dart';
import 'package:yify/data/models/movie.dart';
import 'package:yify/data/services/movie.dart';

class MovieListScreenController extends GetxController {
  final List<Movie> movieList = <Movie>[].obs;
  final MovieService movieService = MovieService();

  @override
  void onReady() async {
    final Response response = await movieService.fetchMovieList();
    final List<dynamic> results = response.body?['results'];

    final List<Movie> parsedMovieList =
        results.map((dynamic movieJson) => Movie.fromMap(movieJson)).toList();
    movieList.addAll(parsedMovieList);

    super.onReady();
  }
}
