import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';

import '../../models/movie_detail_model.dart';
import '../../models/movie_recommendation_model.dart';
import '../../services/api_services.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.movieId});

  final int movieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<MovieDetailModel> movieDetail;
  late Future<MovieRecommendationsModel> movieRecommendation;

  @override
  void initState() {
    // TODO: implement initState
    fetchInitialData();
    super.initState();
  }

  void fetchInitialData() {
    movieDetail = apiServices.getDetailMovie(widget.movieId);
    movieRecommendation = apiServices.getRecommendationMovie(widget.movieId);
    print('Call api movieRecommendation');
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant MovieDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.movieId != oldWidget.movieId) {
      fetchInitialData();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.movieId);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: movieDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movie = snapshot.data;
              String genreText =
                  movie!.genres.map((genre) => genre.name).join(', ');
              return Column(
                children: [
                  movie.backdropPath.isNotEmpty
                      ? Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "$imageUrl${movie.backdropPath}"),
                                    fit: BoxFit.cover),
                              ),
                              child: SafeArea(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color:
                                            Colors.black.withValues(alpha: 0.4),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.arrow_back_ios_new,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                            ),
                          ),
                          child: SafeArea(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black.withValues(alpha: 0.4),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.originalTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              movie.releaseDate.year.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Text(
                                genreText,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          movie.overview,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FutureBuilder(
                      future: movieRecommendation,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final movieRecommendations = snapshot.data;
                          return movieRecommendations!.results.isEmpty
                              ? Text("Something went wrong")
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "More like this",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      GridView.builder(
                                          padding: EdgeInsets.all(8.0),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: movieRecommendations
                                              .results.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 15,
                                                  crossAxisSpacing: 3,
                                                  childAspectRatio: 1.2 / 2),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         MovieDetailScreen(
                                                //       movieId:
                                                //           movieRecommendations
                                                //               .results[index]
                                                //               .id,
                                                //     ),
                                                //   ),
                                                // );
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MovieDetailScreen(
                                                            movieId:
                                                                movieRecommendations
                                                                    .results[
                                                                        index]
                                                                    .id),
                                                  ),
                                                ).then((value) {
                                                  fetchInitialData(); // Gọi lại khi màn hình quay lại
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Column(
                                                  children: [
                                                    movieRecommendations
                                                            .results[index]
                                                            .backdropPath
                                                            .isNotEmpty
                                                        ? CachedNetworkImage(
                                                            imageUrl:
                                                                "$imageUrl${movieRecommendations.results[index].posterPath}",
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                5,
                                                            placeholder: (context,
                                                                    url) =>
                                                                CircularProgressIndicator(),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error),
                                                          )
                                                        : Image.asset(
                                                            "assets/images/netflix.png",
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                5,
                                                          ),
                                                    Expanded(
                                                      child: Text(
                                                        movieRecommendations
                                                            .results[index]
                                                            .originalTitle,
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                );
                        } else {
                          return SizedBox.shrink();
                        }
                      }),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
