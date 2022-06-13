import 'package:get/get.dart';
import 'package:yify/data/models/movie.dart';
import 'package:yify/data/services/movie.dart';

class MovieDetailsScreenController extends GetxController {
  MovieDetailsScreenController({required this.defaultMovie});
  final Movie defaultMovie;

  final Rxn<Movie> _movie = Rxn<Movie>();
  Movie? get movie => this._movie.value;
  set movie(Movie? value) => this._movie.value = value;

  final MovieService movieService = MovieService();

  @override
  void onReady() async {
    movie = defaultMovie;

    final Response response =
        await movieService.fetchMovieById(defaultMovie.id);
    final Movie parsedMovie = Movie.fromMap(response.body);

    movie = parsedMovie;

    super.onReady();
  }
}
