import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animations_sample/sdui_animation.dart';

class BookedDemoPageRoute extends StatefulWidget {
  const BookedDemoPageRoute({super.key});

  @override
  State<BookedDemoPageRoute> createState() => _BookedDemoPageRouteState();
}

class _BookedDemoPageRouteState extends State<BookedDemoPageRoute> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  /// FOR TESTING ONLY
  final _timerDuration = 10;
  int _currentTimerValue = 0;
  late Timer _timer;

  var welcomeGuest = true;

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

    //_animationController.forward();
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
        title: const Text('Booked Card Demo'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [

          const SizedBox(height: 150.0,),

          Column(
            children: [

              AnimatedCrossFade(
                firstChild: getFirstCard(),
                secondChild: getSecondCard(),
                crossFadeState: welcomeGuest ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 600),
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeIn,
                sizeCurve: Curves.bounceOut,
              ),

              const SizedBox(height: 60.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SDUIAnimation(
                    animationType: AnimationType.fadeOut,
                    animationController: _animationController,
                    intervalStart: 0.5,
                    intervalEnd: 1.0,
                    child: getChild(),
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

  Widget getFirstCard() {
    return Stack(
      children: [
        Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.blue,
              ),
              padding: const EdgeInsets.all(12),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0,),
                      Text(
                        "10:30 AM - 11:30 AM",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      Text(
                        "Lighting Lane",
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),

                      SizedBox(height: 12.0,),

                      Text(
                        "Seven Dwarfs Mine Train",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: Colors.white
                        ),
                      ),

                      SizedBox(height: 20.0,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Image.asset(
            'lib/assets/LL.png',
            height: 50.0,
            width: 50.0,
          ),
        ),
        Positioned(
          top: -12,
          right: -12,
          child: Image.asset(
            'lib/assets/rocketImage.png',
            height: 200.0,
            width: 200.0,
          ),
        )
      ],
    );
  }

  Widget getSecondCard() {
    return Stack(
      children: [
        Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.purple,
              ),
              padding: const EdgeInsets.all(12),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0,),
                      Text(
                        "Now - 11:30 AM",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      Text(
                        "Your Lighting\nLane is Ready!",
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),

                      SizedBox(height: 12.0,),

                      Text(
                        "Seven Dwarfs Mine Train",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: Colors.white
                        ),
                      ),

                      SizedBox(height: 20.0,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Image.asset(
            'lib/assets/LL.png',
            height: 50.0,
            width: 50.0,
          ),
        ),
        Positioned(
          top: 45,
          right: 2,
          child: Image.asset(
            'lib/assets/rocketZoom.png',
            height: 200.0,
            width: 200.0,
          ),
        )
      ],
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
          //_animationController.forward();
          setState(() {
            welcomeGuest = !welcomeGuest;
          });

        },
        child: const Text(
          "Trigger Animation",
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