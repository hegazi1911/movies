 
import 'package:movies/services/Api/api.dart';
import 'package:movies/services/Model/details_movies_model.dart';
import 'package:movies/services/Model/movies_list_model.dart';
import 'package:riverpod/riverpod.dart';


  Future<MovieDetails> getDetalies({required dynamic moviesId}) async {
  Map<String, dynamic> data = await Api().get(
    url: "https://www.yts.nz/api/v2/movie_details.json?movie_id=${moviesId}",
    token: '');


MovieDetails movieDetails =MovieDetails.fromJson(data['data'] ['movie']) ; 
    
    return movieDetails;
  }

