import 'package:coffee_enyong_task/login_page.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Icon icon1 = const Icon(Icons.circle);
  Icon icon2 = const Icon(Icons.circle);
  Icon icon3 = const Icon(Icons.circle);


  List<String> imgNames = [
    'lib/assets/images/1.png',
    'lib/assets/images/2.png',
    'lib/assets/images/3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imgNames.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                color: Color(0xFFE7C6A7),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50,top: 250),
                        child: Row(
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Image.asset(
                                'lib/assets/images/${index+1}.png',
                                width: 300,
                                height: 300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 180,),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: Row(
                          children: List.generate(imgNames.length, (indexDots) {
                            return Row(
                              children: [
                                const SizedBox(width: 10,),
                                Container(
                                  width: index == indexDots ? 25: 15,
                                  height: index == indexDots? 25: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFF6F3C03),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  const Positioned(
                    bottom: 250,
                    child: Text('Coffee Enyong',
                    style: TextStyle(
                      color: Color(0xFF6F3C03),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                        } ,
                        child: const Text('Skip',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 26,
                      decoration: TextDecoration.none
                    ),)),
                  )
                ],
              ),
            );
          }),
    );
  }
}
