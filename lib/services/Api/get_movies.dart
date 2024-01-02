import 'package:movies/services/Api/api.dart';
import 'package:movies/services/Api/get_all_movies.dart';
import 'package:movies/services/Model/movies_list_model.dart';
import 'package:riverpod/riverpod.dart';

Future<List<Movies>> getAllMovies(
    {String? query, int? pagenum, List<String>? selectedGenres}) async {
  Map<String, dynamic> data = await Api().get(
      url:
          "https://www.yts.nz/api/v2/list_movies.json/api/v2/list_movies.xml?page=$pagenum&limit=50",
      token: '');

  List<Movies> MoviesList = [];

  for (var i = 0; i < data['data']['movies'].length; i++) {
    MoviesList.add(Movies.fromJson(data['data']['movies'][i]));
  }
  if (query != null) {
    MoviesList = MoviesList.where((element) =>
        element.title!.toLowerCase().contains(query.toLowerCase())).toList();
  }
  if (selectedGenres != null && selectedGenres.isNotEmpty) {
    MoviesList = MoviesList.where((movie) =>
        movie.genres?.any((genre) => selectedGenres.contains(genre)) ??
        false).toList();
  }

  return MoviesList;
}

final allMovies = FutureProvider.family<List<Movies>, List<String>?>((ref, selectedGenres) async {
  return getAllMovies(selectedGenres: selectedGenres);
});
