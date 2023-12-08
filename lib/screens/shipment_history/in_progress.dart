import 'package:flutter/material.dart';

import '../services/shipment_history_json_data.dart';

class InProgressShipment extends StatefulWidget {
  const InProgressShipment({Key? key}) : super(key: key);

  @override
  _InProgressShipmentState createState() => _InProgressShipmentState();
}

class _InProgressShipmentState extends State<InProgressShipment> with TickerProviderStateMixin {
  late AnimationController _cardAnimationController;
  late Animation<Offset> _cardSlideAnimation;

  List<Map<String, String>> allShipment = allShipmentHistory;

  List<Map<String, String>> get inProgressShipments =>
      allShipment.where((shipment) => shipment['status'] == 'in-progress').toList();

  @override
  void initState() {
    super.initState();

    _cardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _cardSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 5.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _cardAnimationController.forward();
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    super.dispose();
  }

  Icon getStatusIcon(String status) {
    switch (status) {
      case 'loading':
        return const Icon(Icons.access_time, size: 20, color: Colors.blue);
      case 'pending':
        return const Icon(Icons.history, size: 20, color: Colors.orange);
      case 'completed':
        return const Icon(Icons.check, size: 20, color: Colors.green);
      case 'canceled':
        return const Icon(Icons.cancel_outlined, size: 20, color: Colors.red);
      case 'in-progress':
        return const Icon(Icons.cached_outlined, size: 20, color: Colors.green);
      default:
        return const Icon(Icons.help_outline, size: 20, color: Colors.grey);
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case 'loading':
        return Colors.blue;
      case 'pending':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'canceled':
        return Colors.red;
      case 'in-progress':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned(
              top: 1,
              left: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
                child: Text(
                  'Shipments',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            Positioned.fill(
              top: 50,
              child: ListView.builder(
                itemCount: inProgressShipments.length,
                itemBuilder: (BuildContext context, int index) {
                  return SlideTransition(
                    position: _cardSlideAnimation,
                    child: Container(
                      color: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          elevation: 0,
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                                child: Wrap(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Row(
                                          children: [
                                            getStatusIcon(inProgressShipments[index]['status']!),
                                            const SizedBox(width: 5,),
                                            Expanded(
                                              child: Text(
                                                inProgressShipments[index]['status']!,
                                                style: TextStyle(fontSize: 12, color: getStatusTextColor(inProgressShipments[index]['status']!)),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                                child: Text(
                                  inProgressShipments[index]['arrivingDay']!,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15,),
                                child: Row(
                                  children: [
                                    Text(
                                      inProgressShipments[index]['comment']!,
                                      style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500, letterSpacing: 0),
                                    ),
                                    const SizedBox(width: 25,),
                                    Expanded(
                                      child: Image.asset('assets/images/whitebox.png', scale: 1,),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      '\$${inProgressShipments[index]['amountPaid']!} USD',
                                      style: TextStyle(color: Colors.deepPurple[900], fontSize: 13, fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 20,
                                      child: Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                                        width: 5,
                                        height: 5,
                                      ),
                                    ),
                                    Text(inProgressShipments[index]['date']!, style: const TextStyle(fontSize: 13)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.transparent,
                      Colors.white54,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
