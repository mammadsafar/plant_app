import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritePlants;
  const FavoritePage({
    super.key,
    required this.favoritePlants,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return widget.favoritePlants.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/favorited.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textDirection: TextDirection.rtl,
                  'لیست علاقه‌مندی‌ها خالی است',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'iranSans',
                      color: Constants.blackColor,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            margin: const EdgeInsets.only(top: 20),
            height: size.height * 0.45,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.favoritePlants.length,
              itemBuilder: (context, index) {
                return NewPlantWidget(
                    plantList: widget.favoritePlants, index: index);
              },
            ),
          );
  }
}
