import 'package:flutter/material.dart';
import 'package:love_4_movies/core/theme/colors.dart';

class CustomSectionTitle extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const CustomSectionTitle({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextButton(
                onPressed: onPressed,
                child: const Text(
                  'See all',
                  style: TextStyle(
                    color: kButtonColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
