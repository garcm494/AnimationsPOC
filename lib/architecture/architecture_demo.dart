import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animations_sample/sdui_animation.dart';

class ArchitectureDemoPageRoute extends StatefulWidget {
  const ArchitectureDemoPageRoute({super.key});

  @override
  State<ArchitectureDemoPageRoute> createState() => _ArchitectureDemoPageRouteState();
}

class _ArchitectureDemoPageRouteState extends State<ArchitectureDemoPageRoute> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  /// FOR TESTING ONLY
  final _timerDuration = 10;
  int _currentTimerValue = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    /// FOR TESTING ONLY
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentTimerValue < _timerDuration) {
          _currentTimerValue++;
        } else {
          _timer.cancel();
        }
      });
    });

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800)
        //duration: Duration(seconds: _timerDuration)
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Architecture Demo'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [

          const SizedBox(height: 300.0,),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SDUIAnimation(
                    animationType: AnimationType.slide,
                    animationController: _animationController,
                    intervalStart: 0.0,
                    intervalEnd: 1.0,
                    direction: AnimationDirection.bottomToTop,

                    child: SDUIAnimation(
                      animationType: AnimationType.fadeIn,
                      animationController: _animationController,
                      intervalStart: 0.5,
                      intervalEnd: 1.0,
                      child: getChild(),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 200.0,),
              
              //Text('$_currentTimerValue / $_timerDuration')
            ],
          ),

          const SizedBox(height: 40.0,),
        ],
      ),
    );
  }

  Widget getChild() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 4.0
        ),
        onPressed: () {
          //TODO: TRIGGER ANIMATION HERE?
        },
        child: const Text(
          "Add to bag - \$20.95",
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        )
    );
  }

}