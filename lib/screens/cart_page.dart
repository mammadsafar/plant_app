import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/extensions.dart';
import 'package:plant_app/widgets/plant_widget.dart';

class CartPage extends StatefulWidget {
  final List<Plant> cartPlants;
  const CartPage({
    super.key,
    required this.cartPlants,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Plant>? cartPlants;
  int totalPrice = 0;
  @override
  void initState() {
    cartPlants = Plant.addedToCartPlants().toSet().toList();
    setState(() {
      totalPrice = calculateTotalPrice();
    });
    // cartPlants = widget.cartPlants.isEmpty
    //     ? Plant.addedToCartPlants().toSet().toList()
    //     : widget.cartPlants;
    super.initState();
  }

  int calculateTotalPrice() {
    int total = 0;
    for (var i = 0; i < cartPlants!.length; i++) {
      total += cartPlants![i].price;
    }
    return total * 1000;
  }

  @override
  Widget build(BuildContext context) {
    return widget.cartPlants.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/add-cart.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textDirection: TextDirection.rtl,
                  'سبد خرید خالی است',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'iranSans',
                    color: Constants.blackColor,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            margin: const EdgeInsets.only(top: 20),
            // height: size.height * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.cartPlants.length,
                    itemBuilder: (context, index) {
                      return NewPlantWidget(
                          plantList: widget.cartPlants, index: index);
                    },
                  ),
                ),
                Column(
                  children: [
                    const Divider(thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              child: Image.asset(
                                  'assets/images/PriceUnit-green.png'),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              totalPrice.toString().farsiNumber,
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lalezar',
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'جمع کل',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Lalezar',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          );
  }
}
