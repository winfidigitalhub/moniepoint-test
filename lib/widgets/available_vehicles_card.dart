import 'package:flutter/material.dart';

class AvailableVehicleCard extends StatefulWidget {
  final String imagePath;
  final String type;
  final String status;

  const AvailableVehicleCard({
    super.key,
    required this.imagePath,
    required this.type,
    required this.status,
  });

  @override
  State<AvailableVehicleCard> createState() => _AvailableVehicleCardState();
}

class _AvailableVehicleCardState extends State<AvailableVehicleCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
              child: Text(
                widget.type,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 8),
              child: Text(widget.status,
                  style: const TextStyle(color: Colors.grey)),
            ),
            Expanded(
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.cover,
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
