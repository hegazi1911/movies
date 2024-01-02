import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/services/Api/get_detalies.dart';
import 'package:movies/services/Model/details_movies_model.dart';
import 'package:movies/services/Model/movies_list_model.dart';
import 'package:movies/widget/custom_detailes_movies.dart';

class DetaliesPage extends StatelessWidget {
  const DetaliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final moviesId = routeArgs['id'];
    final detalies = routeArgs['detalies'];
    final image = routeArgs['image'];
    final quality1 = routeArgs['quality1'];
    final quality2 = routeArgs['quality2'];
    final url1 = routeArgs['url1'];
    final url2 = routeArgs['url2'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<MovieDetails>(
          future: getDetalies(moviesId: moviesId),
          builder: (context, snapshot) {
            print(moviesId);
            print(detalies);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              MovieDetails movieDetails = snapshot.data!;

              return DetaliesMovies(
                movieDetails: movieDetails,
                detaliesMovie: detalies,
                image: image,
                quality: quality1,
                quality1: quality2 ?? 'null',
                url1: url1.toString(),
                url2: url2.toString(),
              );
            } else {
              return const Text('No data available');
            }
          }),
    );
  }
}
