import 'package:flutter/material.dart';
import 'package:moniepoint_test/animations/animatedArrowBack.dart';
import 'package:moniepoint_test/screens/calculate_screen.dart';
import 'package:moniepoint_test/screens/shipment_history/all_shipment.dart';
import 'package:moniepoint_test/screens/shipment_history/canceled.dart';
import 'package:moniepoint_test/screens/shipment_history/completed.dart';
import 'package:moniepoint_test/screens/shipment_history/in_progress.dart';
import 'package:moniepoint_test/screens/shipment_history/pending.dart';

class ShipmentScreen extends StatefulWidget {
  const ShipmentScreen({Key? key}) : super(key: key);

  @override
  _ShipmentScreenState createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> with TickerProviderStateMixin {
  late AnimationController _cardAnimationController;
  late AnimationController _tabAnimationController;
  late Animation<Offset> _cardSlideAnimation;
  late Animation<Offset> _tabSlideAnimation;

  @override
  void initState() {
    super.initState();

    _cardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _tabAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _cardSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -5.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _tabSlideAnimation = Tween<Offset>(
      begin: const Offset(5.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _tabAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _cardAnimationController.forward();
    _tabAnimationController.forward();

    controller = TabController(length: TabMenu.length, vsync: this);
    controller.addListener(_handleTabChange);
  }

  late TabController controller;
  List<int> notificationCounts = [12, 5, 3, 4, 0]; // Adjust the notification counts as needed

  @override
  void dispose() {
    _cardAnimationController.dispose();
    _tabAnimationController.dispose();
    controller.dispose();
    super.dispose();
  }

  List<String> TabMenu = [
    'All',
    'Completed',
    'In progress',
    'Pending',
    'Canceled',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: SlideTransition(
          position: _cardSlideAnimation,
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: const AnimatedArrowBack(),
            title: const Text(
              'Shipment history',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30.0),
              child: SlideTransition(
                position: _tabSlideAnimation,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  unselectedLabelColor: Colors.white,
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.white24),
                  indicatorColor: Colors.orange,
                  controller: controller,
                  tabs: List.generate(
                    TabMenu.length,
                        (index) => _buildTabWithBadge(index),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          AllShipment(),
          CompletedShipment(),
          InProgressShipment(),
          PendingShipment(),
          CanceledShipment(),
        ],
      ),
    );
  }

  Widget _buildTabWithBadge(int index) {
    return Tab(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 30, top: 5, bottom: 5),
            child: Text(TabMenu[index]),
          ),
          if (notificationCounts[index] > 0)
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 7, right: 7),
                decoration: BoxDecoration(
                  color: controller.index == index ? Colors.orange : Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  notificationCounts[index].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _handleTabChange() {
    setState(() {});
  }
}
