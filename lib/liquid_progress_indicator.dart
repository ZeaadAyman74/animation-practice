import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class LiquidIndicator extends StatefulWidget {
  const LiquidIndicator({super.key});

  @override
  _LiquidIndicatorState createState() => _LiquidIndicatorState();
}

class _LiquidIndicatorState extends State<LiquidIndicator> with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );
    animationController.addListener(() {
      setState(() {

      });
    });

    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = animationController.value * 100;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: 85,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: LiquidLinearProgressIndicator(
                borderRadius: 20.0,
                value: animationController.value,
                valueColor: const AlwaysStoppedAnimation(Colors.amber),
                center: Text('${percentage.toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                direction: Axis.horizontal,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            SizedBox(
              height: 175,
              width: 175,
              child: LiquidCircularProgressIndicator(
                valueColor: const AlwaysStoppedAnimation(Colors.lightGreenAccent),
                value: animationController.value,
                center: Text('${percentage.toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black,
                  ),),
                borderColor: Colors.black,
                borderWidth: 1.0,
                direction: Axis.vertical,
              ),
            ),

            LiquidCustomProgressIndicator(
              direction: Axis.vertical,
              shapePath: _buildHeartPath(),
              center: Text('${percentage.toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                ),),
              valueColor: const AlwaysStoppedAnimation(Colors.red),
              value: animationController.value,
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Path _buildHeartPath() {
    return Path()
      ..moveTo(55, 15)
      ..cubicTo(55, 12, 50, 0, 30, 0)
      ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
      ..cubicTo(0, 55, 20, 77, 55, 95)
      ..cubicTo(90, 77, 110, 55, 110, 37.5)
      ..cubicTo(110, 37.5, 110, 0, 80, 0)
      ..cubicTo(65, 0, 55, 12, 55, 15)
      ..close();
  }
}