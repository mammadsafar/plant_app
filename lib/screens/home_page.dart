import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/widgets/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Plant> _plantList = Plant.plantList;
  bool toggleIsFavorite(bool isFavorites) {
    return !isFavorites;
  }

  final List<String> _plantType = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل‌کار |',
    '| گل‌باغچه‌ای |',
    '| گل‌سمی |',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Box
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mic,
                        color: Constants.blackColor.withOpacity(0.6),
                      ),
                      const Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'iranSans',
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 5),
                              hintText: 'جستجو....',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Constants.blackColor.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Category
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 1),
              height: 70,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _plantType.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantType[index],
                        style: TextStyle(
                          fontFamily: 'iranSanse',
                          fontSize: 18,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Product One
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: DetailPage(
                              plantId: _plantList[index].plantId,
                            ),
                            type: PageTransitionType.rightToLeft),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorite(
                                        (_plantList[index].isFavorated));
                                    _plantList[index].isFavorated = isFavorited;
                                  });
                                },
                                icon: _plantList[index].isFavorated == true
                                    ? Icon(
                                        Icons.favorite,
                                        color: Constants.primaryColor,
                                      )
                                    : Icon(
                                        Icons.favorite_border_outlined,
                                        color: Constants.primaryColor,
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            right: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                r'$ ' +
                                    _plantList[index]
                                        .price
                                        .toString()
                                        .farsiNumber,
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16,
                                    fontFamily: 'Lalezar'),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            bottom: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    fontFamily: 'YekanBakh',
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(
                                      fontFamily: 'YekanBakh',
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // New Plant - Text
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 18, bottom: 15, top: 20),
              child: const Text(
                'گیاهان جدید',
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Product Two
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: DetailPage(
                              plantId: _plantList[index].plantId,
                            ),
                            type: PageTransitionType.rightToLeft),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      margin: const EdgeInsets.only(bottom: 20, top: 10),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 80,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 20,
                                  child: Image.asset(
                                      'assets/images/PriceUnit-green.png')),
                              const SizedBox(width: 5),
                              Text(
                                _plantList[index].price.toString().farsiNumber,
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lalezar'),
                              ),
                            ],
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Constants.primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 0,
                                right: 0,
                                child: Image.asset(
                                  _plantList[index].imageURL,
                                  height: 80,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      _plantList[index].category,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'YekanBakh',
                                      ),
                                    ),
                                    Text(
                                      _plantList[index].plantName,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'YekanBakh',
                                        color: Constants.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
