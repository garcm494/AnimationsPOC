import 'package:flutter/material.dart';

class DisneyCard extends StatelessWidget {
  const DisneyCard({
    super.key,
    required this.title,
    required this.asset
  });

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(asset),
        Positioned(
          bottom: 16,
          left: 16,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 28,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}