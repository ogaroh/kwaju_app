import 'package:assessment/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    required this.imageUrl,
    required this.title,
    required this.active,
    super.key,
  });

  final String imageUrl;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: active ? kPrimaryColor : kDefaultGrey,
            radius: 35,
            child: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: active ? kPrimaryColor : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
