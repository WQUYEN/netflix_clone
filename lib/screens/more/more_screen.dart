import 'package:flutter/material.dart';

import '../../widgets/coming_soon_movie.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: const Text(
              'New & Hot',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 27,
                  width: 27,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: "🔥 Everyone's watching",
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ComingSoonMovie(
                    imageUrl:
                        'https://res.cloudinary.com/itimages/image/fetch/c_scale,w_400,q_auto:eco,f_auto/https://images.randomhouse.com/cover/d/9780593723241',
                    overView:
                        'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                    logoUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/3/38/Stranger_Things_logo.png",
                    month: "Jun",
                    day: "19",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ComingSoonMovie(
                    imageUrl:
                        'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                    overView:
                        'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                    logoUrl:
                        "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                    month: "Mar",
                    day: "07",
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: ComingSoonMovie(
                imageUrl:
                    'https://res.cloudinary.com/itimages/image/fetch/c_scale,w_400,q_auto:eco,f_auto/https://images.randomhouse.com/cover/d/9780593723241',
                overView:
                    'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                logoUrl:
                    "https://logowik.com/content/uploads/images/stranger-things4286.jpg",
                month: "Feb",
                day: "20",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
