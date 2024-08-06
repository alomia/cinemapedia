import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreeenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            centerTitle: true,
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                
                MoviesSlideshow(movies: slideShowMovies),
                MovieHorizontalListview(
                  title: 'En cines',
                  subtitle: 'Miercoles 9',
                  movies: nowPlayingMovies,
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieHorizontalListview(
                  title: 'Proximamente',
                  subtitle: 'En este mes',
                  movies: upcomingMovies,
                  loadNextPage: () => ref
                      .read(upcomingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieHorizontalListview(
                  title: 'Populares',
                  movies: popularMovies,
                  loadNextPage: () => ref
                      .read(popularMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieHorizontalListview(
                  title: 'Mejor calificadas',
                  subtitle: 'Desde siempre',
                  movies: topRatedMovies,
                  loadNextPage: () => ref
                      .read(topRatedMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                const SizedBox(height: 10),
              ],
            );
          }, childCount: 1),
        )
      ],
    );
  }
}
