import 'package:flutter/material.dart';
import 'sdui_animation.dart';

/// Random animations --
class RandomAnimationsRoute extends StatefulWidget {
  const RandomAnimationsRoute({super.key, required this.title});
  final String title;

  @override
  State<RandomAnimationsRoute> createState() => _RandomAnimationsRouteState();
}


class _RandomAnimationsRouteState extends State<RandomAnimationsRoute> {
  int _counter = 0;
  double _size = 50.0;
  bool _large = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    var welcomeGuest = true;

    if (_counter.isEven) {
      welcomeGuest = true;
    } else {
      welcomeGuest = false;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10,),

            SDUIAnimation(
              animationType: AnimationType.crossFade,
              duration: const Duration(seconds: 1),
              secondChild: ElevatedButton(
                style: style,
                onPressed: () {},
                child: const Text('Cross Fade Animation'),
              ),
              shouldWelcomeGuest: welcomeGuest,
              child: const Text('Cross Fade Animation'),),

            const SizedBox(height: 10,),

            SDUIAnimation(
                animationType: AnimationType.opacity,
                duration: const Duration(seconds: 1),
                opacityLevel: welcomeGuest ? 1.0 : 0.0,
                child: const Text(
                    'OPACITY ANIMATION',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18)
                )
            ),

            const SizedBox(height: 10,),

            SDUIAnimation(
              animationType: AnimationType.align,
              alignment: welcomeGuest ? Alignment.center : Alignment.bottomRight,
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                style: style,
                onPressed: () {

                },
                child: const Text('Alignment Animation / Transitions'),
              ),
            ),

            const SizedBox(height: 10,),

            SDUIAnimation(
              animationType: AnimationType.align,
              alignment: welcomeGuest ? Alignment.center : Alignment.bottomRight,
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                style: style,
                onPressed: () {
                },
                child: const Text('Complex Animations'),
              ),
            ),

            const SizedBox(height: 10,),

            SDUIAnimation(
              animationType: AnimationType.align,
              alignment: welcomeGuest ? Alignment.center : Alignment.bottomRight,
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                style: style,
                onPressed: () {
                },
                child: const Text('PLP to PDP Transition'),
              ),
            ),

            const SizedBox(height: 10,),

            const SDUIAnimation(animationType: AnimationType.builder),

            const SizedBox(height: 10,),

            GestureDetector(
              onTap: () => _updateSize(),
              child: SDUIAnimation(
                  animationType: AnimationType.size,
                  duration: const Duration(seconds: 2),
                  curve: Curves.bounceOut,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.open_in_full, size: _size),
                        const Text('Animated Size')
                      ]
                  )
              ),
            ),

            const SizedBox(height: 10,),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SDUIAnimation(
                    animationType: AnimationType.container,
                    duration: const Duration(seconds: 2),
                    width: welcomeGuest ? 100.0 : 50.0,
                    height: welcomeGuest ? 50.0 : 100.0,
                    color: welcomeGuest ? Colors.red : Colors.blue,
                    alignment: welcomeGuest ? Alignment.center : Alignment.topCenter,
                    curve: Curves.fastOutSlowIn,
                    child: const FlutterLogo(size: 75,),
                  ),
                  const Text(' Animated Container')
                ]
            ),

            const SizedBox(height: 10,),

            SizedBox(
                width: 100,
                height: 200,
                child: Stack(
                  children: <Widget>[
                    SDUIAnimation(
                      animationType: AnimationType.positioned,
                      width: welcomeGuest ? 100.0 : 50.0,
                      height: welcomeGuest ? 50.0 : 100.0,
                      top: welcomeGuest ? 50.0 : 100.0,
                      duration: const Duration(seconds: 1),
                      child: const ColoredBox(
                          color: Colors.blue,
                          child: Center(child: Text('Animated Positioned'))
                      ),
                    )
                  ],
                )
            ),

            const SizedBox(height: 10,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.animation),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _updateSize() {
    setState(() {
      _size = _large ? 100.0 : 50.0;
      _large = !_large;
    });
  }
}


