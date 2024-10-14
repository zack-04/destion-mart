import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _rowWidget(context),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Image.asset(
                    product['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '\$${product['price']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _columnWidget(
                          context,
                          product['brand'],
                          product['qnt'],
                        ),
                      ),
                      Expanded(
                        child: _columnWidget2(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Product Description',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    product['description'],
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _rowWidget(BuildContext context) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.chevron_left,
          size: 30,
        ),
      ),
      const SizedBox(width: 30),
      const Padding(
        padding: EdgeInsets.only(top: 3),
        child: Text(
          'Product Details',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 19,
          ),
        ),
      ),
    ],
  );
}

Widget _columnWidget(BuildContext context, String brand, String qnt) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Details',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Text(
            'Brand:',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            brand,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Row(
        children: [
          Text(
            'Qnt:',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            qnt,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    ],
  );
}

Widget _columnWidget2(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Seller',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Icon(
            Icons.house,
            color: Colors.grey.shade700,
            size: 20,
          ),
          const SizedBox(width: 5),
          const Text(
            'Great Indian Grocery',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Row(
        children: [
          Icon(
            Icons.person,
            color: Colors.grey.shade700,
            size: 20,
          ),
          const SizedBox(width: 5),
          const Text(
            'Brampton',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        ],
      )
    ],
  );
}
