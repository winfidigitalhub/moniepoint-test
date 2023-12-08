import 'package:flutter/material.dart';

class SearchReceiptNumber extends StatefulWidget {
  const SearchReceiptNumber({
    required this.filterReceiptDetails,
    required this.filteredReceiptDetails,
    Key? key,
  }) : super(key: key);

  final Function filterReceiptDetails;
  final List<Map<String, String>> filteredReceiptDetails;

  @override
  State<SearchReceiptNumber> createState() => _SearchReceiptNumberState();
}

class _SearchReceiptNumberState extends State<SearchReceiptNumber> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.filteredReceiptDetails.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  'assets/images/circleboxinside.jpg',
                                  scale: 3,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.filteredReceiptDetails[index]
                                            ['shipmentName'] ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        widget.filteredReceiptDetails[index]
                                                ['shipmentNumber'] ??
                                            '',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600,
                                            letterSpacing: 0),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey),
                                          width: 5,
                                          height: 5,
                                        ),
                                      ),
                                      Text(
                                        widget.filteredReceiptDetails[index]
                                                ['destinationFrom'] ??
                                            '',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                            letterSpacing: 0),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        widget.filteredReceiptDetails[index]
                                                ['destinationTo'] ??
                                            '',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                            letterSpacing: 0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
