import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/tv_series_model.dart';

import '../screens/detail/movie_detail_screen.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key, required this.data});
  final TvSeriesModel data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.results.length,
        itemBuilder: (context, index, realIndex) {
          var url = data.results[index].backdropPath.toString();
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(
                          movieId: data.results[index].id,
                        )),
              );
            },
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: "$imageUrl$url",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(data.results[index].name)
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
          aspectRatio: 16 / 9,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          initialPage: 0,
        ),
      ),
    );
  }
}
