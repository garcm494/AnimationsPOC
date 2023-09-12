import 'package:flutter/material.dart';
import 'package:animations_sample/disney_card.dart';
import 'dart:math' as math;

class ComplexAnimationsRoute extends StatefulWidget {
  const ComplexAnimationsRoute({super.key});

  @override
  State<ComplexAnimationsRoute> createState() => _ComplexAnimationsRouteState();
}

class _ComplexAnimationsRouteState extends State<ComplexAnimationsRoute>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Animations'),
      ),
      body: Center(
        child: Column(
          children: [

            const DisneyCard(
              title: 'Star Wars: Galaxy s Edge',
              asset: 'lib/assets/swge.png',
            ),

            const SizedBox(height: 5,),

            AnimatedBuilder(
              animation: _animationController,
              child: const DisneyCard(
                title: 'Avengers Campus',
                asset: 'lib/assets/avengers_campus.png',
              ),
              builder: (context, child) => Transform.rotate(
                angle: _animationController.value * math.pi,
                child: child,
              ),
            ),

            const SizedBox(height: 5,),

            ElevatedButton(
                onPressed: () {
                  if (_animationController.isCompleted) {
                    _animationController.reset();
                  } else {
                    _animationController.forward();
                  }
                },
                child: const Text('Trigger Animation')
            )
          ],
        ),
      ),
    );
  }
}

