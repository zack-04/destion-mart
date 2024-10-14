import 'package:destion_mart/widgets/product_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                bottom: 20,
              ),
              color: const Color(0xFF275F60),
              child: const Text(
                'Hello, User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ProductGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
