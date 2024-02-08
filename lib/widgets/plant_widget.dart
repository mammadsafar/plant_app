import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/widgets/extensions.dart';

class NewPlantWidget extends StatelessWidget {
  const NewPlantWidget({
    super.key,
    required List<Plant> plantList,
    required this.index,
  }) : _plantList = plantList;

  final List<Plant> _plantList;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    child: Image.asset('assets/images/PriceUnit-green.png')),
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
  }
}
