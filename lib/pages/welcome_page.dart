import 'package:carousel_slider/carousel_slider.dart';
import 'package:destion_mart/pages/login_page.dart';
import 'package:destion_mart/pages/signup_page.dart';
import 'package:destion_mart/widgets/custom_button.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _current = 0;
  final List<String> imgList = [
    'assets/images/people1.jpg',
    'assets/images/people2.jpg',
    'assets/images/people3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const Spacer(),
                CarouselSlider(
                  items: imgList
                      .map(
                        (item) => Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF275F60),
                              width: 1,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 170,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 1.0,
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                DotsIndicator(
                  dotsCount: imgList.length,
                  position: _current,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    activeColor: const Color(0xFF275F60),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Explore Deals',
                  style: GoogleFonts.inter(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Checkout list of deals available for\npreferred store and choose what best for\nyou',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                CustomButton(
                  bgColor: WidgetStateProperty.all<Color>(
                    const Color(0xFF275F60),
                  ),
                  fontColor: Colors.white,
                  text: 'Signup',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                CustomButton(
                  fontColor: const Color(0xFF275F60),
                  bgColor: WidgetStateProperty.all<Color>(Colors.white),
                  side: WidgetStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Color(0xFF275F60),
                      width: 2,
                    ),
                  ),
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
