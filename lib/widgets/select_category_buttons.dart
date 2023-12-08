import 'package:flutter/material.dart';

class SelectCategoryButtons extends StatefulWidget {
  const SelectCategoryButtons({super.key});

  @override
  _SelectCategoryButtonsState createState() => _SelectCategoryButtonsState();
}

class _SelectCategoryButtonsState extends State<SelectCategoryButtons> {
  List<String> categories = [
    'Documents',
    'Glass',
    'Liquid',
    'Food',
    'Electronic',
    'Product',
    'Others',
  ];

  Set<String> selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Wrap(
            spacing: 10,
            children: List.generate(
              categories.length,
                  (index) => buildButton(categories[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    bool isSelected = selectedCategories.contains(buttonText);
    Color buttonColor = isSelected ? Colors.black : Colors.grey.shade700;

    double calculateWidth() {
      const minWidth = 40.0;
      const paddingAndSpacing = 1.0;
      double textWidth = buttonText.length * 8.0;
      return minWidth + textWidth + paddingAndSpacing;
    }

    return Container(
      width: calculateWidth(),
      child: isSelected
          ? ElevatedButton(
        onPressed: () {
          _changeButtonColor(buttonText);
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(4.0)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.done, size: 16),
            const SizedBox(width: 4),
            Text(
              buttonText,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      )
          : OutlinedButton(
        onPressed: () {
          _changeButtonColor(buttonText);
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          side: MaterialStateProperty.all(BorderSide(color: buttonColor)),
          foregroundColor: MaterialStateProperty.all(buttonColor),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 14, color: Colors.blueGrey.shade900),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void _changeButtonColor(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        // Deselect the category if already selected
        selectedCategories.remove(category);
      } else {
        // Limit to only 5 selected categories
        if (selectedCategories.length < 5) {
          selectedCategories.add(category);
        }
      }
    });
  }
}