import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlayingMovies({int page = 0});
  Future<List<Movie>> getPopularMovies({int page = 0});
}
