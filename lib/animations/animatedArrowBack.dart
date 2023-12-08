import 'package:flutter/material.dart';

class AnimatedArrowBack extends StatefulWidget {
  final VoidCallback? onBack;

  const AnimatedArrowBack({Key? key, this.onBack}) : super(key: key);

  @override
  _AnimatedArrowBackState createState() => _AnimatedArrowBackState();
}

class _AnimatedArrowBackState extends State<AnimatedArrowBack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-5.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () async {
          if (await Navigator.maybePop(context)) {
            Navigator.pushNamed(context, '/bottomNavHome');
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
