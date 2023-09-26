import 'package:animations_sample/architecture/architecture_demo.dart';
import 'package:animations_sample/booked/booked_card.dart';
import 'package:animations_sample/complex_animations_route.dart';
import 'package:animations_sample/plp/plp_main_page_route.dart';
import 'package:animations_sample/sdui_custom_page_route.dart';
import 'package:flutter/material.dart';
import 'package:animations_sample/sdui_animation.dart';
import 'random_animations_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animations Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

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

            /// TRANSITIONS
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TransitionsSampleRoute())
                );
              },
              child: const Text('Transitions'),
            ),

            const SizedBox(height: 10,),

            /// RANDOM ANIMATIONS
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RandomAnimationsRoute(title: 'Random Animations'))
                );
              },
              child: const Text('Testing Random Animations'),
            ),

            const SizedBox(height: 10,),

            /// COMPLEX ANIMATIONS
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ComplexAnimationsRoute())
                );
              },
              child: const Text('Complex Animations'),
            ),

            const SizedBox(height: 10,),

            ///PLP to PDP - MULTIPLE ANIMATIONS
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PLPMainPageRoute())
                );
              },
              child: const Text('PLP to PDP Transition'),
            ),

            const SizedBox(height: 10,),

            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ArchitectureDemoPageRoute())
                );
              },
              child: const Text('Architecture Sample'),
            ),

            const SizedBox(height: 10,),

            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BookedDemoPageRoute())
                );
              },
              child: const Text('Booked plan card state change'),
            ),

            const SizedBox(height: 10,),
            ///-----------------------------------------------------------------------------
          ],
        ),
      ),
    );
  }

}

/// Transitions POC --
class TransitionsSampleRoute extends StatelessWidget {
  const TransitionsSampleRoute({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transitions Sample'),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  SDUICustomPageRoute(
                      child: const TransitionsDetailRoute(),
                      direction: AxisDirection.left
                  ),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.arrow_back_rounded),
                SizedBox(width: 10,),
                Text('From Right to Left')
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                SDUICustomPageRoute(
                    child: const TransitionsDetailRoute(),
                    direction: AxisDirection.right
                ),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.arrow_forward),
                SizedBox(width: 10,),
                Text('From Left to Right')
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                SDUICustomPageRoute(
                    child: const TransitionsDetailRoute(),
                    direction: AxisDirection.up
                ),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.arrow_upward),
                SizedBox(width: 10,),
                Text('From Bottom to Top')
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                SDUICustomPageRoute(
                    child: const TransitionsDetailRoute(),
                    direction: AxisDirection.down
                ),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.arrow_downward),
                SizedBox(width: 10,),
                Text('From Top to Bottom')
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20.0),
              ListTile(
                leading: const SDUIAnimation(
                  animationType: AnimationType.hero,
                  tag: 'hero-rectangle',
                  child: Image(image: AssetImage('lib/assets/swge.png'),),
                ),
                onTap: () => _gotoDetailsPage(context),
                title: const Text(
                  'Star Wars: Galaxy s Edge (Hero Transition)',
                ),
              ),
            ],
          )
        ],
      )
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Star Wars: Galaxy s Edge'),
        ),
        body: const Center(
          child: Column(
            children: [
              SDUIAnimation(
                  animationType: AnimationType.hero,
                  tag: 'hero-rectangle',
                  child: Image(image: AssetImage('lib/assets/swge.png'),),
              ),
              Text('Discover Star Wars: Galaxys Edge at Walt Disney World Resort and the Disneyland Resort, where you can live out your own Star Wars story, fly the Millennium Falcon and explore a remote outpost where adventure awaits.')
            ],
          ),
        ),
      ),
    ));
  }

}

class TransitionsDetailRoute extends StatelessWidget {
  const TransitionsDetailRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Star Wars: Galaxy s Edge'),
        ),
        body: const Center(
          child: Column(
            children: [
              SDUIAnimation(
                animationType: AnimationType.hero,
                tag: 'hero-rectangle2',
                child: Image(image: AssetImage('lib/assets/swge.png'),),
              ),
              Text('Discover Star Wars: Galaxys Edge at Walt Disney World Resort and the Disneyland Resort, where you can live out your own Star Wars story, fly the Millennium Falcon and explore a remote outpost where adventure awaits.')
            ],
          ),
        )
    );
  }
}

