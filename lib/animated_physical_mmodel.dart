import 'package:flutter/material.dart';

class PhysicalModelAnimation extends StatefulWidget {
  const PhysicalModelAnimation({Key? key}) : super(key: key);

  @override
  State<PhysicalModelAnimation> createState() => _PhysicalModelAnimationState();
}

class _PhysicalModelAnimationState extends State<PhysicalModelAnimation> {
  bool _isPresses = false;

  void press() {
    setState(() {
      _isPresses = !_isPresses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Physical Model Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            press();
          },
          child: AnimatedPhysicalModel(
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
            elevation: _isPresses ? 90 : 0,
            color: Colors.grey,
            shadowColor: Colors.blueGrey,
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              'assets/tom.png',
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
