import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Scrolling extends StatefulWidget {
  const Scrolling({Key? key}) : super(key: key);

  @override
  State<Scrolling> createState() => _ScrollingState();
}

class _ScrollingState extends State<Scrolling> {
  final itemKey = GlobalKey();
  final itemController = ItemScrollController();
final scrollController=ScrollController();
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: ListView.builder(
  //       itemCount: 31,
  //       itemBuilder: (context, index) =>index==11? MyCard(key:itemKey ,num: index):MyCard(num: index),
  //     ),
  //     floatingActionButton: FloatingActionButton(onPressed: ()async => scrollToItem(),child: const Icon(Icons.arrow_downward_outlined),),
  //     floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScrollablePositionedList.builder(
        itemCount: 31,
        itemScrollController: itemController,
        itemBuilder: (context, index) => MyCard(num: index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => scrollToItemUsingIndex(),
        child: const Icon(Icons.arrow_downward_outlined),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  Future scrollToItem() async {
    final context = itemKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.5, duration: const Duration(milliseconds: 500));
  }

  Future scrollToItemUsingIndex() async {
    itemController.scrollTo(index: 30,duration: const Duration(seconds: 1),);
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.num}) : super(key: key);
  final int num;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        color: const Color(0xff556847),
        child: Center(
            child: Text(
          num.toString(),
          style: const TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
