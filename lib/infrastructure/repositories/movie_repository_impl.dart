import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 0}) {
    return datasource.getNowPlayingMovies(page: page);
  }
  
  @override
  Future<List<Movie>> getPopularMovies({int page = 0}) {
    return datasource.getPopularMovies(page: page);
  }  
}
