import 'package:flutter/material.dart';

class CompletedShipment extends StatefulWidget {
  const CompletedShipment({Key? key}) : super(key: key);

  @override
  _CompletedShipmentState createState() => _CompletedShipmentState();
}

class _CompletedShipmentState extends State<CompletedShipment> with TickerProviderStateMixin {



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
     body: Center(child: Text('You dont have any completed orders yet')),
      );

  }

}
