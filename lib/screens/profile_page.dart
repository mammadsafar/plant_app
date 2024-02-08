import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            // Profile Image
            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(0.5),
                  width: 5,
                ),
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                backgroundColor: Colors.transparent,
                radius: 70,
              ),
            ),
            // Profile Name
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'محمد صفرزاده',
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 20,
                    fontFamily: 'YekanBakh',
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 20,
                  child: Image.asset('assets/images/verified.png'),
                ),
              ],
            ),
            // Profile Email

            const SizedBox(height: 7),

            Text(
              'MohammadSafar2014@gmail.com',
              style: TextStyle(
                color: Constants.blackColor.withOpacity(0.4),
                fontSize: 15,
                fontFamily: 'YekanBakh',
              ),
            ),

            const SizedBox(height: 20),

            // Profile Bio
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'گل ها',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                        fontFamily: 'YekanBakh',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '12',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(0.4),
                        fontSize: 15,
                        fontFamily: 'YekanBakh',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'دنبال شده',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                        fontFamily: 'YekanBakh',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '120',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(0.4),
                        fontSize: 15,
                        fontFamily: 'YekanBakh',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'دنبال کننده',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                        fontFamily: 'YekanBakh',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '1200',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(0.4),
                        fontSize: 15,
                        fontFamily: 'YekanBakh',
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Profile Options
            const SizedBox(height: 20),
            const Column(
              children: [
                OptionWidget(icon: Icons.person, title: 'پروفایل من'),
                OptionWidget(icon: Icons.settings, title: 'تنظیمات'),
                OptionWidget(
                    icon: Icons.notifications, title: 'اطلاع‌رسانی‌ها'),
                OptionWidget(icon: Icons.share, title: 'شبکه‌ها اجتماعی'),
                OptionWidget(icon: Icons.logout, title: 'خروج'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
