import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComingSoonMovie extends StatelessWidget {
  final String imageUrl;
  final String overView;
  final String logoUrl;
  final String month;
  final String day;
  const ComingSoonMovie(
      {super.key,
      required this.imageUrl,
      required this.overView,
      required this.logoUrl,
      required this.month,
      required this.day});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                month,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                day,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 5,
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  CachedNetworkImage(imageUrl: imageUrl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.3,
                        height: size.height * 0.2,
                        child: CachedNetworkImage(
                          imageUrl: logoUrl,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                              Text(
                                "Remind me",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 24,
                              ),
                              Text(
                                "Info",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Coming soon on $month $day'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        overView,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
