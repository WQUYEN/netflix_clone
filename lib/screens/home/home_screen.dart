import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/widgets/movie_card.dart';

import '../../services/api_services.dart';
import '../../widgets/custom_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<MovieModel> movies;
  late Future<MovieModel> nowPlayingMovies;
  late Future<TvSeriesModel> tvSeries;
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movies = apiServices.getMovieModel();
    nowPlayingMovies = apiServices.getNowPlayingMovies();
    tvSeries = apiServices.getTopRatedTvSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          height: 50,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.blue,
              width: 27,
              height: 27,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: tvSeries,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CustomCarousel(data: snapshot.data!);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: MovieCard(
                  future: nowPlayingMovies, headLineText: 'Now Playing Movies'),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: MovieCard(future: movies, headLineText: 'Upcoming Movies'),
            ),
          ],
        ),
      ),
    );
  }
}
