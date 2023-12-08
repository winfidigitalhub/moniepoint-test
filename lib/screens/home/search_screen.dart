import 'package:flutter/material.dart';
import 'package:moniepoint_test/widgets/search_receipt_number.dart';
import '../../animations/animatedArrowBack.dart';
import '../services/receipt_json_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
    required this.searchIconTag,
  }) : super(key: key);
  final String searchIconTag;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  List<Map<String, String>> receiptDetails = allReceiptDetails;
  List<Map<String, String>> filteredReceiptDetails = [];

  void filterReceiptDetails(String query) {
    setState(() {
      filteredReceiptDetails = receiptDetails
          .where((receipt) =>
              receipt['shipmentName']!
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              receipt['shipmentNumber']!
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              receipt['destinationFrom']!
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              receipt['destinationTo']!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredReceiptDetails = receiptDetails;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 5.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastEaseInToSlowEaseOut,
    ));

    _controller.forward();
  }

  TextEditingController _searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: ListTile(
            leading: const AnimatedArrowBack(),
            title: Hero(
              tag: widget.searchIconTag,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        width: 50,
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchInputController,
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter the receipt numbers ...',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.black),
                          onChanged: (query) {
                            filterReceiptDetails(query);
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange,
                        ),
                        child: const InkWell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.flip_sharp,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Container(
            color: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchReceiptNumber(
                filterReceiptDetails: filterReceiptDetails,
                filteredReceiptDetails: filteredReceiptDetails,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchInputController.dispose();
    super.dispose();
  }
}
