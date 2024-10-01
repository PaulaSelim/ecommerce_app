import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                //logo

                SizedBox(
                  // height: 24,
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Image.asset(
                  'lib/images/pngwing.com.png',
                  height: 300,
                  width: 300,
                ),

                SizedBox(
                  // height: 240,
                  height: MediaQuery.of(context).size.height * 0.28,
                ),

                //title

                const Text(
                  'Just Do It',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                SizedBox(
                  // height: 48,
                  height: MediaQuery.of(context).size.height * 0.06,
                ),

                //subtitle

                const Text(
                  'Brand new sneakers & custom\nkicks made just for you',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  // height: 48,
                  height: MediaQuery.of(context).size.height * 0.06,
                ),

                //start now button

                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: const Center(
                      child: Text(
                        'Shop Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
