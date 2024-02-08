import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class OptionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const OptionWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Constants.blackColor,
            size: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 20,
                  fontFamily: 'iranSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                icon,
                color: Constants.blackColor.withOpacity(0.5),
                size: 23,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
