import 'package:flutter/material.dart';

class PendingShipment extends StatefulWidget {
  const PendingShipment({Key? key}) : super(key: key);

  @override
  _PendingShipmentState createState() => _PendingShipmentState();
}

class _PendingShipmentState extends State<PendingShipment> with TickerProviderStateMixin {


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('You dont have any pending orders yet')),
    );

  }

}
