import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';

import '../screens/detail/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.future,
    required this.headLineText,
  });
  final Future<MovieModel> future;
  final String headLineText;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            var data = snapshot.data?.results;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headLineText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data?.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                        movieId: data![index].id,
                                      )),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                                "$imageUrl${data?[index].posterPath}"),
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
