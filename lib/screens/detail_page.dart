import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/root.dart';

import 'package:plant_app/widgets/extensions.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Plant> myCart = [];

  bool toggleIsFavorite(bool isFavorites) {
    return !isFavorites;
  }

  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

    return Scaffold(
      body: Stack(
        children: [
          // AppBar
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // x Button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.primaryColor.withOpacity(0.3),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                // Like Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bool isFavorited = toggleIsFavorite(
                          (plantList[widget.plantId].isFavorated));
                      plantList[widget.plantId].isFavorated = isFavorited;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.primaryColor.withOpacity(0.3),
                    ),
                    child: plantList[widget.plantId].isFavorated == true
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
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 80,
                left: 30,
                right: 30,
              ),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    plantList[widget.plantId].plantName,
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontFamily: 'Lalezar',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Constants.primaryColor),
                          Text(
                            plantList[widget.plantId]
                                .rating
                                .toString()
                                .farsiNumber,
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontFamily: 'Lalezar',
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 19,
                            child: Image.asset(
                                'assets/images/PriceUnit-green.png'),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            plantList[widget.plantId]
                                .price
                                .toString()
                                .farsiNumber,
                            style: TextStyle(
                                color: Constants.blackColor,
                                fontFamily: 'Lalezar',
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    plantList[widget.plantId].decription,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Constants.blackColor.withOpacity(0.7),
                      fontFamily: 'iranSans',
                      height: 1.6,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Image
          Positioned(
            top: 125,
            left: 10,
            child: SizedBox(
                height: 390,
                child: Image.asset(plantList[widget.plantId].imageURL)),
          ),
          // Body
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  // Feature
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantFeature(
                            title: 'اندازه‌گیاه',
                            plantFeature: plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            title: 'رطوبت‌هوا',
                            plantFeature: plantList[widget.plantId]
                                .humidity
                                .toString()
                                .farsiNumber,
                          ),
                          PlantFeature(
                            title: 'دمای‌نگهداری',
                            plantFeature: plantList[widget.plantId]
                                .temperature
                                .farsiNumber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50.0,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: plantList[widget.plantId].isSelected
                    ? Colors.redAccent.withOpacity(0.4)
                    : Constants.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.1, 1.1),
                    blurRadius: 5.0,
                    color: plantList[widget.plantId].isSelected
                        ? Colors.redAccent.withOpacity(0.4)
                        : Constants.primaryColor.withOpacity(0.3),
                  ),
                ],
              ),
              child: InkResponse(
                onTap: () {
                  setState(() {
                    final List<Plant> addedToCartPlants =
                        Plant.addedToCartPlants();

                    myCart = addedToCartPlants.toSet().toList();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const RootPage(bottomIndex: 2);
                      },
                    ),
                  );
                },
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.1, 1.1),
                      blurRadius: 5.0,
                      color: Constants.primaryColor.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Center(
                  child: InkResponse(
                    onTap: () {
                      // Add to cart
                      setState(
                        () {
                          bool isSelected = toggleIsSelected(
                              (plantList[widget.plantId].isSelected));
                          plantList[widget.plantId].isSelected = isSelected;

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // Future.delayed(const Duration(seconds: 2), () {
                              //   Navigator.of(context).pop(true);
                              // });
                              return AlertDialog(
                                content: SingleChildScrollView(
                                  child: Center(
                                    child: plantList[widget.plantId].isSelected
                                        ? Text(
                                            'گیاه ${plantList[widget.plantId].plantName} با موفقیت به سبد خرید اضافه شد',
                                            textAlign: TextAlign.justify,
                                            textDirection: TextDirection.rtl,
                                            style: const TextStyle(
                                              fontFamily: 'CloudSoftB',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          )
                                        : Text(
                                            'گیاه ${plantList[widget.plantId].plantName} با موفقیت از سبد خرید حذف شد',
                                            textAlign: TextAlign.justify,
                                            textDirection: TextDirection.rtl,
                                            style: const TextStyle(
                                              fontFamily: 'CloudSoftB',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                                backgroundColor:
                                    plantList[widget.plantId].isSelected
                                        ? Colors.greenAccent.withOpacity(0.9)
                                        : Colors.redAccent.withOpacity(0.9),
                                contentTextStyle: const TextStyle(
                                    color: Colors.black, fontSize: 59),
                                titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 209, 28, 209)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: const Text(
                      'افزودن به سبد خرید',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lalezar',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({
    super.key,
    required this.title,
    required this.plantFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Constants.blackColor,
              fontFamily: 'Lalezar',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          plantFeature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontFamily: 'Lalezar',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
