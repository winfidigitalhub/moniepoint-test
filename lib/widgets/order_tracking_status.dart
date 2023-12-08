import 'package:flutter/material.dart';

class OrderTrackingStatusCard extends StatefulWidget {
  const OrderTrackingStatusCard(
      {super.key,
      required this.senderAddress,
      required this.receiverAddress,
      required this.orderImage,
      required this.shipmentNumber,
      required this.timeFrom,
      required this.timeTo,
      required this.status});

  final String? senderAddress;
  final String? receiverAddress;
  final Image? orderImage;
  final String? shipmentNumber;
  final String? timeFrom;
  final String? timeTo;
  final String? status;

  @override
  State<OrderTrackingStatusCard> createState() =>
      _OrderTrackingStatusCardState();
}

class _OrderTrackingStatusCardState extends State<OrderTrackingStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Shipment Number',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600),
                      ),
                      Text(
                        widget.shipmentNumber!,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: widget.orderImage!,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Divider(
                color: Colors.grey.shade100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/images/arrow_red_up.png',
                          scale: 3,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sender',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(widget.senderAddress!),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Time',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            width: 8,
                            height: 8,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              Text(widget.timeFrom!),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text('-'),
                              ),
                              Text(widget.timeTo!),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/images/boxarrowdown.jpg',
                          scale: 3,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Receiver',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(widget.receiverAddress!),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(widget.status!)
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Divider(
                color: Colors.grey.shade100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.add, color: Colors.orange),
                      Text(
                        'Add Stop',
                        style: TextStyle(color: Colors.orange),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
