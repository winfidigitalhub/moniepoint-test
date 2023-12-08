import 'package:flutter/material.dart';
import 'package:moniepoint_test/screens/home/search_screen.dart';
import 'package:moniepoint_test/screens/services/vehicles_json_data.dart';
import '../../widgets/available_vehicles_card.dart';
import '../../widgets/order_tracking_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late String searchIconTag;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _horizontalSlideAnimation;

  @override
  void initState() {
    super.initState();
    // Generate a unique tag using the current timestamp
    searchIconTag = 'searchIcon_${DateTime.now().millisecondsSinceEpoch}';

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );


    _fadeAnimation = Tween<double>(begin: 0.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 5.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _horizontalSlideAnimation = Tween<Offset>(
      begin: const Offset(5.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<Map<String, String>> vehicleImages = allVehicles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            leadingWidth: MediaQuery.of(context).size.width,
            leading: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
              ),
              title: Row(
                children: [
                  Transform.rotate(
                    angle: 200,
                    child: const Icon(
                      Icons.send_rounded,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: Text('Your location',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: Text('Wertheimer, Illinois',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 20, top: 10),
                child: Hero(
                  flightShuttleBuilder: _customFlightShuttleBuilder,
                  tag: searchIconTag,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text(
                              'Enter the receipt number ...',
                              style: TextStyle(color: Colors.grey),
                            ),
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                    const Duration(milliseconds: 500),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return FadeTransition(
                                        opacity: animation
                                            .drive(Tween<double>(
                                            begin: 0.0, end: 1.5)
                                            .chain(CurveTween(
                                          curve: Curves
                                              .fastLinearToSlowEaseIn,
                                        ))),
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double>
                                        secondaryAnimation) =>
                                        SearchScreen(
                                            searchIconTag: searchIconTag),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange),
                          child: const InkWell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.flip_sharp,
                                    color: Colors.white,
                                    size: 25,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.grey.shade100),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          'Tracking',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OrderTrackingStatusCard(
                        senderAddress: 'Atlanta, 5243',
                        receiverAddress: 'Chicago, 6342',
                        shipmentNumber: 'NEJ20089934122231',
                        orderImage: Image.asset(
                          'assets/images/forklift.jpeg',
                          scale: 20,
                        ),
                        timeFrom: '2 days',
                        timeTo: '3 days',
                        status: 'Waiting to collect',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5, right: 5, bottom: 15),
                        child: Text(
                          'Available vehicles',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3.8,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                            position: _horizontalSlideAnimation,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: vehicleImages.length,
                              itemBuilder: (context, index) {
                                return AvailableVehicleCard(
                                  type: vehicleImages[index]['type'] ?? '',
                                  status: vehicleImages[index]['status'] ?? '',
                                  imagePath: vehicleImages[index]['imagePath'] ?? '',
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customFlightShuttleBuilder(
      BuildContext flightContext,
      Animation<double> animation,
      HeroFlightDirection flightDirection,
      BuildContext fromHeroContext,
      BuildContext toHeroContext,
      ) {
    // Customize the in-flight hero widget here
    switch (flightDirection) {
      case HeroFlightDirection.push:
        return Material(
          color: Colors.transparent,
          child: FadeTransition(
            opacity: animation
                .drive(Tween<double>(begin: 0.0, end: 1.5).chain(CurveTween(
              curve: Curves.fastLinearToSlowEaseIn,
            ))),
            child: toHeroContext.widget,
          ),
        );
      case HeroFlightDirection.pop:
        return Material(
          color: Colors.transparent,
          child: fromHeroContext.widget,
        );
    }
  }
}
