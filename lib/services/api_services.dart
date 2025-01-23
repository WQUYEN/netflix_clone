import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/movie_recommendation_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;

class ApiServices {
  Future<MovieModel> getMovieModel() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Success load movies upcoming');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load movies upcoming");
  }

  Future<MovieModel> getNowPlayingMovies() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Success load movie now playing');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load movie now playing");
  }

  Future<TvSeriesModel> getTopRatedTvSeries() async {
    endPoint = "tv/top_rated";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Success load tv top rated');
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load tv top rated");
  }

  Future<SearchModel> getSearchedMovies({String? searchText}) async {
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint";
    print("search url $url");
    final response = await http
        .get(Uri.parse(url), headers: {'Authorization': "Bearer $accessToken"});

    if (response.statusCode == 200) {
      print('Success search');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to search");
  }

  Future<MovieRecommendationsModel> getPopularMovies() async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";
    print("search url $url");
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Success load popular movies');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load popular movies");
  }

  Future<MovieDetailModel> getDetailMovie(int movieId) async {
    endPoint = "movie/$movieId";
    final url = "$baseUrl$endPoint$key";
    print("search url $url");
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Success load detail movies');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load detail movies");
  }

  Future<MovieRecommendationsModel> getRecommendationMovie(int movieId) async {
    endPoint = "movie/$movieId/recommendations";
    final url = "$baseUrl$endPoint$key";
    print("search url $url");
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Success load recommendations movies');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load recommendations movies");
  }
}
