import 'dart:developer';

import 'package:assessment/shared/models/product.dart';
import 'package:assessment/shared/theme/colors.dart';
import 'package:assessment/shopping/view/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFf2f4f6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            child: Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'From\n',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'KSh ${product.price.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Chip(
                  side: BorderSide(color: kPrimaryColor),
                  labelPadding: EdgeInsets.zero,
                  padding: EdgeInsets.only(
                    left: 3,
                    right: 3,
                  ),
                  visualDensity: VisualDensity.compact,
                  label: Text('Save Ksh 60'),
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            child: GradientButton(
              text: 'Choose Options',
              onPressed: () {
                log('Choose options clicked!');
              },
              gradientColors: [
                kSecondaryColor,
                kSecondaryColor.withOpacity(0.7),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
