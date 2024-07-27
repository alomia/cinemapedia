import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: moviedb.backdropPath.isEmpty
            ? 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png'
            : 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}',
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: moviedb.posterPath.isEmpty
            ? 'https://dynamoprojects.com/wp-content/uploads/2022/12/no-image.jpg'
            : 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );
  
  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
    adult: moviedb.adult,
        backdropPath: moviedb.backdropPath.isEmpty
            ? 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png'
            : 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}',
        genreIds: moviedb.genres.map((e) => e.name).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: moviedb.posterPath.isEmpty
            ? 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png'
            : 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
  );
}
