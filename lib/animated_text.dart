import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  double _fontSize = 14;
  Color _color = Colors.deepOrange;

  void _increaseFontSize() {
    setState(() {
      _fontSize = 22;
      _color = Colors.blueAccent;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = 14;
      _color = Colors.deepOrange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            curve: Curves.elasticInOut,
              style: TextStyle(fontSize: _fontSize, color: _color),
              duration: const Duration(milliseconds: 1000),
              child: const Text('I am a software engineer')),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => _increaseFontSize(),
                  icon: const Icon(Icons.add)),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () => _decreaseFontSize(),
                  icon: const Icon(Icons.remove))
            ],
          )
        ],
      ),
    );
  }
}
