import 'package:flutter/material.dart';
import 'package:practice/align_animation.dart';
import 'package:practice/food_list.dart';
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

        ],
      ),
    );
  }
}
