import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProviders>(context);

    // print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: Text('Películas en Carteleras'),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search_sharp),
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //CarSwiper
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              //Listado Horizzontal de Películas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares!',
                onNextPage: () => moviesProvider.getPopularMovies(),
                //movies
                //title:
              ),
            ],
          ),
        ));
  }
}
