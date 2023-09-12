import 'package:animations_sample/disney_card.dart';
import 'package:animations_sample/plp/plp_card.dart';
import 'package:flutter/material.dart';

class PLPMainPageRoute extends StatefulWidget {
  const PLPMainPageRoute({super.key});

  @override
  State<PLPMainPageRoute> createState() => _PLPMainPageRouteState();

}

class _PLPMainPageRouteState extends State<PLPMainPageRoute> {

  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    /// Adding overlay "shop" button
    WidgetsBinding.instance.addPostFrameCallback((_) {
      overlayEntry = OverlayEntry(
          builder: (BuildContext context) {
            return SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  heightFactor: 1.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                            'lib/assets/shop.png',
                            height: 55.0,
                            width: 55.0,
                          )
                      ),
                      const SizedBox(width: 20.0,),
                    ],
                  )
                )
            );
          }
      );
      Overlay.of(context).insert(overlayEntry!);
    });

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 2) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: null,
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
        children: const [
          Stack(
            children: [
              DisneyCard(
                  title: 'Mickey Mouse',
                  asset: 'lib/assets/avengers_campus.png'),
              Positioned(
                top: 2,
                right: 2,
                child: Icon(Icons.favorite, color: Colors.white,),
              )
            ],
          ),

          Text(''),
          Text(''),
          Stack(
            children: [
              DisneyCard(
                  title: 'Mickey Mouse',
                  asset: 'lib/assets/avengers_campus.png'),
              Positioned(
                top: 2,
                right: 2,
                child: Icon(Icons.favorite, color: Colors.white,),
              )
            ],
          ),


          Stack(
            children: [
              PLPCard(
                asset: 'lib/assets/moana_2.png',
                icon: '',
                header: 'PERSONALIZE',
                title: 'Moana Cover-Up for Girls',
                subtitle: '\$20.95',
                detail: 'ONLY 3 IN STOCK',
                tag: 'moana',
              )
            ],
          ),
          Text(''),
          Text(''),
          Text(''),
          Text(''),

          Text(''),
          Text(''),
          Text(''),
          Text(''),
          Text(''),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  @override
  void dispose() {
    overlayEntry!.remove();
  }
}