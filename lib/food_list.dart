import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  double bannerHeight = 0;
  final scrollController = ScrollController();
  bool hideBanner = false;

  @override
  void didChangeDependencies() {
    bannerHeight = MediaQuery.of(context).size.height * .25;
    super.didChangeDependencies();
  }

  @override
  void initState() {


    scrollController.addListener(() {
      setState(() {
        hideBanner = scrollController.offset > 50;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: const Icon(
              Icons.search,
              size: 25,
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: const Icon(
              Icons.person,
              size: 25,
              color: Colors.black,
            ),
          )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: hideBanner ? 0 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: Colors.white,
              height: hideBanner ? 0 : bannerHeight,
              alignment: Alignment.topCenter,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  BannerItem(
                    title: 'Most Favorites',
                    subTitle: '20 items',
                    color: Colors.orange.shade500,
                    height: bannerHeight,
                  ),
                  BannerItem(
                      title: 'Newest',
                      subTitle: '20 items',
                      height: bannerHeight,
                      color: Colors.blue.shade500),
                  BannerItem(
                      title: 'Most Favorites',
                      subTitle: '20 items',
                      height: bannerHeight,
                      color: Colors.blue.shade500),
                  BannerItem(
                      title: 'Most Favorites',
                      subTitle: '20 items',
                      height: bannerHeight,
                      color: Colors.blue.shade500),
                  BannerItem(
                      title: 'Most Favorites',
                      subTitle: '20 items',
                      height: bannerHeight,
                      color: Colors.blue.shade500),
                ],
              ),
            ),
          ),
          Expanded(
              child: VerticalList(
            scrollController: scrollController,
          )),
        ],
      ),
    );
  }
}


class BannerItem extends StatelessWidget {
  const BannerItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.color,
      required this.height})
      : super(key: key);
  final Color color;
  final String title;
  final String subTitle;
  final double height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return FittedBox(
      alignment: Alignment.topCenter,
      fit: BoxFit.fill,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: width * .35,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              maxLines: 2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;

  @override
  State<VerticalList> createState() => _VerticalListState();
}
class _VerticalListState extends State<VerticalList> {
  double topContainer = 0;
  @override
  void didChangeDependencies() {
    print(MediaQuery.of(context).size.height * .2*.7);
    super.didChangeDependencies();
  }
@override
  void initState() {
  widget.scrollController.addListener(() {
    double value = (widget.scrollController.offset) /
        (MediaQuery.of(context).size.height * .2*.7);
    print('${widget.scrollController.offset}****************************');
    print('$value ///////////////////////////////////////');
    setState(() {
      topContainer=value;
    });
  });
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: widget.scrollController,
        itemCount: food.length,
        itemBuilder: (context, index) {
          double scale=1.0;
          if(topContainer>.5){
            scale=index+1-topContainer;
            if(scale<0){
              scale=0;
            }else if(scale>1){
              scale=1;
            }
          }
          return Transform(
              transform: Matrix4.identity()..scale(scale,scale),
              alignment: Alignment.bottomCenter,
              child: Align(
                  heightFactor: 0.7,
                  alignment: Alignment.topCenter,
                  child: FoodItem(item: food[index])));
        });
  }
}

class FoodItem extends StatelessWidget {
  const FoodItem({Key? key, required this.item}) : super(key: key);
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['name'],
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                item['brand'],
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '\$ ${item['price']}',
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ],
          ),
          Image.asset(
            item['image'],
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          )
        ],
      ),
    );
  }
}

const List<Map<String, dynamic>> food = [
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
  {
    'name': 'Burger',
    'brand': 'Macdonals',
    'price': '2.5',
    'image': 'assets/food.jpg'
  },
];


class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      opacity: height > 0 ? 1 : 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        color: Colors.white,
        height: height,
        alignment: Alignment.topCenter,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            BannerItem(
              title: 'Most Favorites',
              subTitle: '20 items',
              color: Colors.orange.shade500,
              height: height,
            ),
            BannerItem(
                title: 'Newest',
                subTitle: '20 items',
                height: height,
                color: Colors.blue.shade500),
            BannerItem(
                title: 'Most Favorites',
                subTitle: '20 items',
                height: height,
                color: Colors.blue.shade500),
            BannerItem(
                title: 'Most Favorites',
                subTitle: '20 items',
                height: height,
                color: Colors.blue.shade500),
            BannerItem(
                title: 'Most Favorites',
                subTitle: '20 items',
                height: height,
                color: Colors.blue.shade500),
          ],
        ),
      ),
    );
  }
}
