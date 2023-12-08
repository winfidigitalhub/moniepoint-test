import 'package:flutter/material.dart';
import 'package:moniepoint_test/animations/animatedArrowBack.dart';
import '../widgets/select_category_buttons.dart';
import 'dart:math' as math;

class CalculateScreen extends StatefulWidget {


   CalculateScreen({Key? key,}) : super(key: key);

  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen>
    with TickerProviderStateMixin {
  late AnimationController _cardAnimationController;
  late AnimationController _buttonsAnimationController;
  late AnimationController _buttonAnimationController;
  late Animation<Offset> _cardSlideAnimation;
  late Animation<Offset> _buttonsSlideAnimation;
  late Animation<Offset> _buttonSlideAnimation;
  late Animation<Offset> _listTileSlideAnimation;

  @override
  void initState() {
    super.initState();

    _cardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _buttonsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _cardSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _buttonsSlideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _buttonsAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _listTileSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _cardAnimationController.forward();
    _buttonsAnimationController.forward();
    _buttonAnimationController.forward();
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    _buttonsAnimationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: const AnimatedArrowBack(),
        title: const Text(
          'Calculate',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.grey.shade50,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 20,
                ),
                child: Text(
                  'Destination',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),

              // Animated card
              SlideTransition(
                position: _cardSlideAnimation,
                child: Card(
                  surfaceTintColor: Colors.white,
                  shadowColor: Colors.white,
                  margin: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            prefixIcon: Padding(
                              padding:
                              const EdgeInsets.only(left: 10, right: 10),
                              child: Transform.rotate(
                                angle: math.pi / 1,
                                child: const Icon(Icons.archive_outlined,
                                    color: Colors.grey),
                              ),
                            ),
                            hintText: 'Sender location',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Icon(Icons.archive_outlined,
                                  color: Colors.grey),
                            ),
                            hintText: 'Receiver location',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Icon(Icons.scale_outlined,
                                  color: Colors.grey),
                            ),
                            hintText: 'Approx weight',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const ListTile(
                title: Text(
                  'Packaging',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'What are you sending?',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              ),

              // Animated packaging
              SlideTransition(
                position: _listTileSlideAnimation,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    elevation: 1,
                    shadowColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/onlyboxwhite.jpg',
                        scale: 2,
                      ),
                      title: const Text(
                        'Box',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),

              const ListTile(
                title: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'What are you sending?',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              ),

              // Animated SelectCategoryButtons
              SlideTransition(
                position: _buttonsSlideAnimation,
                child: const Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: SelectCategoryButtons(),
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              // Calculate button
              SlideTransition(
                position: _buttonSlideAnimation,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/calculatedTotal');

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[600],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
