import 'package:flutter/material.dart';
import 'package:practice/align_animation.dart';
import 'package:practice/animated_opacity.dart';
import 'package:practice/animated_physical_mmodel.dart';
import 'package:practice/animated_text.dart';
import 'package:practice/food_list.dart';
import 'package:practice/liquid_progress_indicator.dart';
import 'package:practice/scrolling.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          MaterialButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AlignAnimation(),
            )),
            child: const Center(
              child: Text('Alignment Animation'),
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FoodList(),
            )),
            child: const Center(
              child: Text('Food List'),
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Scrolling(),
            )),
            child: const Center(
              child: Text('Alignment Scrolling'),
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AnimatedText(),
            )),
            child: const Center(
              child: Text('Alignment Text'),
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const OpacityAnimation(),
            )),
            child: const Center(
              child: Text('Opacity Animation'),
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PhysicalModelAnimation(),
            )),
            child: const Center(
              child: Text('Physical Model Animation'),
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LiquidIndicator(),
            )),
            child: const Center(
              child: Text('Liquid Indicator'),
            ),
          ),


        ],
      ),
    );
  }
}
