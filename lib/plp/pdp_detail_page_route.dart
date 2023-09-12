import 'package:flutter/material.dart';
import 'package:animations_sample/sdui_animation.dart';

/// Detail page that extends state ful widget since animations will happen here.
class PDPDetailPageRoute extends StatefulWidget {
  const PDPDetailPageRoute({super.key});

  @override
  State<PDPDetailPageRoute> createState() => _PDPDetailPageRouteState();
}

/// Extends with `SingleTickerProviderStateMixin` (Tick is similar to clock's tick which means
/// that at every certain duration TickerProvider will render the class state and redraw that object)
class _PDPDetailPageRouteState extends State<PDPDetailPageRoute> with SingleTickerProviderStateMixin {

  ///Is used to control animations, helps to go from one number to another number in a smooth way.
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    ///Initializing the Animation Controller.
    _animationController = AnimationController(
        /// This property represents the Ticket provider
        vsync: this,
        /// Defines the duration of the whole animations on the Controller
        duration: const Duration(milliseconds: 800)
    );

    /// Triggers the animations
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: SDUIAnimation(
          animationType: AnimationType.slide,
          direction: AnimationDirection.rightToLeft,
          animationController: _animationController,
          intervalStart: 0.0,
          intervalEnd: 1.0,
          child: SDUIAnimation(
              animationType: AnimationType.fadeIn,
              animationController: _animationController,
              intervalStart: 0.5,
              intervalEnd: 1.0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              )
          ),),
        backgroundColor: const Color(0xFFFEF8E4),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xFFFEF8E4)
        ),
        child: Center(
          child: Column(
            children: [
              /// Main image - Hero Animation
              const SDUIAnimation(
                animationType: AnimationType.hero,
                tag: 'moana',
                child: Image(
                  image: AssetImage('lib/assets/moana_2.png'),
                  height: 300,),
              ),

              const SizedBox(height: 40.0,),

              /// CAROUSEL WITH ITEMS
              SDUIAnimation(
                  animationType: AnimationType.slide,
                  direction: AnimationDirection.bottomToTop,
                  animationController: _animationController,
                  intervalStart: 0.0,
                  intervalEnd: 1.0,
                  child: SDUIAnimation(
                    animationType: AnimationType.fadeIn,
                    animationController: _animationController,
                    intervalStart: 0.5,
                    intervalEnd: 1.0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(1.0, 1.0), // shadow direction: bottom right
                                      )
                                    ]
                                ),
                                child: Image.asset(
                                  'lib/assets/moana_2.png',
                                  height: 55.0,
                                  width: 55.0,
                                )
                            ),

                            const SizedBox(width: 20.0,),

                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(1.0, 1.0),
                                      )
                                    ]
                                ),
                                child: Image.asset(
                                  'lib/assets/first.png',
                                  height: 55.0,
                                  width: 55.0,
                                )
                            ),

                            const SizedBox(width: 20.0,),

                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(1.0, 1.0), // shadow direction: bottom right
                                      )
                                    ]
                                ),
                                child: Image.asset(
                                  'lib/assets/second.png',
                                  height: 55.0,
                                  width: 55.0,
                                )
                            ),

                            const SizedBox(width: 20.0,),

                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(1.0, 1.0), // shadow direction: bottom right
                                      )
                                    ]
                                ),
                                child: Image.asset(
                                  'lib/assets/third.png',
                                  height: 55.0,
                                  width: 55.0,
                                )
                            ),

                            const SizedBox(width: 20.0,),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(1.0, 1.0), // shadow direction: bottom right
                                    )
                                  ]
                              ),
                              child: Image.asset(
                                'lib/assets/fourth.png',
                                height: 55.0,
                                width: 55.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFF3E464B),
                            ),
                            Text(
                                'PERSONALIZE',
                                style: TextStyle
                                  (
                                    fontSize: 16,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF3E464B)
                                )
                            )
                          ],
                        ),
                        const SizedBox(height: 5.0,),
                        const Text(
                            'Moana Cover-Up for Girls',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 38,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )
                        ),
                        const SizedBox(height: 5.0,),
                        const Text(
                            '\$20.95',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.normal,
                                color: Colors.black
                            )
                        ),
                        const SizedBox(height: 5.0,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'MORE DETAILS',
                                style: TextStyle
                                  (
                                    fontSize: 16,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF3E464B)
                                )
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xFF3E464B),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
              ),

              const SizedBox(height: 70.0,),

              /// Button
              SDUIAnimation(

                animationType: AnimationType.scale,
                start: 0.8,
                finish: 1.0,
                animationController: _animationController,
                curve: Curves.elasticOut,

                child: SDUIAnimation(
                  animationType: AnimationType.slide,
                  animationController: _animationController,
                  direction: AnimationDirection.bottomToTop,
                  intervalStart: 0.8,
                  intervalEnd: 1.0,
                  child: Container(
                      height: 120.0,
                      width: MediaQuery.of(context).size.width - 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(1.0, 1.0), // shadow direction: bottom right
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      elevation: 4.0
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Add to bag - \$20.95",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  )
                              ),
                              const SizedBox(width: 20.0,),
                              const Icon(
                                Icons.favorite_border_sharp,
                                size: 50,
                                color: Colors.blue,)
                            ],
                          ),
                          const SizedBox(height: 20.0,),
                        ],
                      )
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}