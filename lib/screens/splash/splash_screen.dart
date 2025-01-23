import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/images/netflix.json",
          onLoaded: (composition) {
            // Thời gian chạy của animation
            Future.delayed(composition.duration, () {
              if (mounted) {
                // Chuyển sang màn hình tiếp theo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavBar()),
                );
              }
            });
          },
        ),
      ),
    );
  }
}
