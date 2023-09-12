import 'package:animations_sample/plp/pdp_detail_page_route.dart';
import 'package:animations_sample/sdui_animation.dart';
import 'package:flutter/material.dart';

class PLPCard extends StatelessWidget {
  const PLPCard({
    super.key,
    required this.asset,
    required this.icon,
    required this.header,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.tag
  });

  final String asset;
  final String icon;
  final String header;
  final String title;
  final String subtitle;
  final String detail;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PDPDetailPageRoute())
            )
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFFF0F4F6)
            ),
            child: SDUIAnimation(
              animationType: AnimationType.hero,
              tag: tag,
              child: Image.asset(asset, height: 200,),
            ),
          ),
        ),
        const SizedBox(height: 2,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const SizedBox(width: 4,),
            const Icon(
              Icons.star,
              color: Colors.black26,
              size: 18,
            ),
            const SizedBox(width: 6,),
            Text(
                header,
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: Colors.black26
                )
            )
          ],
        ),
        const SizedBox(height: 2,),
        Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                color: Colors.black
            )
        ),
        const SizedBox(height: 2,),
        Text(
            subtitle,
            style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                color: Colors.black
            )
        ),
        const SizedBox(height: 2,),
        Text(
            detail,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                color: Colors.red
            )
        )
      ],
    );
  }
}

