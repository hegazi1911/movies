 
import 'package:movies/services/Api/api.dart';
import 'package:movies/services/Model/movies_list_model.dart';
import 'package:riverpod/riverpod.dart';


  Future<List<Movies>> getAllMovies({String? query}) async {
  Map<String, dynamic> data = await Api().get(
    url: "https://www.yts.nz/api/v2/list_movies.json",
    token: '');

  List<Movies> MoviesList = [];
  

  for (var i = 0; i < data['data']['movies'].length; i++) {
    MoviesList.add(Movies.fromJson(data['data']['movies'][i]));
    }
    if(query != null){ 
  MoviesList = MoviesList.where((element) => element.title!.toLowerCase().contains(query.toLowerCase())).toList();
}
    return MoviesList;
  }

final allMovies = FutureProvider<List<Movies>>((ref) async {
  return getAllMovies();
});