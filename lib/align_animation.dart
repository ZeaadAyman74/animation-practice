import 'package:flutter/material.dart';

class AlignAnimation extends StatefulWidget {
  const AlignAnimation({Key? key}) : super(key: key);

  @override
  State<AlignAnimation> createState() => _AlignAnimationState();
}

class _AlignAnimationState extends State<AlignAnimation> {
  int _jerryAlignment = 1;
  int _tomAlignment = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Alignment Animation'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: getJerryAlignment(_jerryAlignment),
            duration: const Duration(milliseconds: 400),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.transparent,
              child: Image.asset('assets/jerry.png'),
            ),
          ),
          AnimatedAlign(
            alignment: getTomAlignment(_tomAlignment),
            duration: const Duration(milliseconds: 400),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.transparent,
              child: Image.asset('assets/tom.png'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.animation),
        onPressed: () {
          setState(() {
            ++_jerryAlignment;
            ++_tomAlignment;
          });
        },
      ),
    );
  }

  Alignment getJerryAlignment(int alignmentValue) {
    switch (alignmentValue) {
      case 1:
        return Alignment.topCenter;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.centerLeft;
      case 4:
        return Alignment.center;
      case 5:
        return Alignment.centerRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
      default:
        _jerryAlignment = 0;
        return Alignment.topLeft;
    }
  }

  Alignment getTomAlignment(int alignmentValue) {
    switch (alignmentValue) {
      case 1:
        return Alignment.topCenter;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.centerLeft;
      case 4:
        return Alignment.center;
      case 5:
        return Alignment.centerRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
      default:
        _tomAlignment = 0;
        return Alignment.topLeft;
    }
  }

}
