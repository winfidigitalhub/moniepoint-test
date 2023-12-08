import 'package:flutter/material.dart';

class CanceledShipment extends StatefulWidget {
  const CanceledShipment({Key? key}) : super(key: key);

  @override
  _CanceledShipmentState createState() => _CanceledShipmentState();
}

class _CanceledShipmentState extends State<CanceledShipment> with TickerProviderStateMixin {


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
      body: Center(child: Text('You dont have any canceled orders yet')),
    );

  }

}
