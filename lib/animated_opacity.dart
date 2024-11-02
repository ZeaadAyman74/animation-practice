import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({Key? key}) : super(key: key);

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Animated Opacity'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
              child: const Text(
                'I am a software engineer',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInCirc,
                child: Image.asset(
                  'assets/tom.png',
                  height: 100,
                  width: 100,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeInCirc,
                child: Image.asset(
                  'assets/jerry.png',
                  height: 100,
                  width: 100,
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.animation),
        onPressed: () async {
          await end();
         Future.delayed(const Duration(milliseconds: 900)).then((value){
           Navigator.of(context).push(MaterialPageRoute(
             builder: (context) => const Test(),
           ));
           end();
         });
        },
      ),
    );
  }

  Future<void> end() async {
    setState(() {
      _visible = !_visible;
    });
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
