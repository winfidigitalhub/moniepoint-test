import 'package:flutter/material.dart';

class CalculatedTotalScreen extends StatefulWidget {
  const CalculatedTotalScreen({Key? key}) : super(key: key);

  @override
  _CalculatedTotalScreenState createState() => _CalculatedTotalScreenState();
}

class _CalculatedTotalScreenState extends State<CalculatedTotalScreen>
    with TickerProviderStateMixin {
  late AnimationController _cardAnimationController;
  late Animation<Offset> _cardSlideAnimation;
  late Animation<double> _numberAnimation;

  @override
  void initState() {
    super.initState();

    _cardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _cardSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 4.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _numberAnimation = Tween<double>(
      begin: 300.0,
      end: 1460.0,
    ).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _cardAnimationController.forward();
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _cardSlideAnimation,
                  child: Image.asset(
                    'assets/images/movematelogo.png',
                    height: 60,
                  ),
                ),
                SizedBox(height: 30,),
                SlideTransition(
                  position: _cardSlideAnimation,
                  child: Image.asset(
                    'assets/images/whitebox.png',
                    height: 200,
                  ),
                ),
                SlideTransition(
                  position: _cardSlideAnimation,
                  child: const Center(
                    child: Text('Total Estimated Amount', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w400),),
                  ),
                ),
                SlideTransition(
                  position: _cardSlideAnimation,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _numberAnimation,
                      builder: (context, child) {
                        return Text(
                          '\$${_numberAnimation.value.toStringAsFixed(0)} USD', // Add the dollar sign
                          style: const TextStyle(fontSize: 24, color: Colors.green),
                        );
                      },
                    ),
                  ),
                ),
                SlideTransition(
                  position: _cardSlideAnimation,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 20),
                      child: Text(
                        'This amount is estimated and will vary\nif you change your location or weight',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                // Calculate button
                SlideTransition(
                  position: _cardSlideAnimation,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/bottomNavHome');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[600],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Back to home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
