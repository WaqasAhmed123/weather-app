import 'package:flutter/material.dart';
import 'package:weather/views/home.dart';

import '../widgets/background_color.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: gradientBackground,
        ),
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/weather.png",
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              'Weather',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 64,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            const Text(
              'ForeCasts',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 64,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFDDB130)),
            ),
            const SizedBox(
                // height: MediaQuery.sizeOf(context).height * 0.05,
                ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
              child: Container(
                height: 72,
                width: 304,
                decoration: BoxDecoration(
                  color: const Color(0xFFDDB130),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Center(
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
