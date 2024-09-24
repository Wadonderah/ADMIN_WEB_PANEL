import 'package:admin_web_panel/view/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

import 'banner_screen.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        titleMsg: "ADMIN WEB PANEL",
        showBackButton: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Upload Bunner and Category.

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  // Upload Banners Button.

                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BannerScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 117,
                      vertical: 30,
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  icon: const Icon(
                    Icons.screen_share_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Upload Banner".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),

                // Upload Category Button.
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 110,
                      vertical: 30,
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  icon: const Icon(
                    Icons.category_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Upload Category".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
              ],
            ),

            // User Activate and Block Account Button.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  // User Activate Account Button.

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 30,
                    ),
                    backgroundColor: Colors.green,
                  ),
                  icon: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  label: Text(
                    "All User Activated Account".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),

                // User Block Account Button.
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 110,
                      vertical: 30,
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  icon: const Icon(
                    Icons.block_flipped,
                    color: Colors.white,
                  ),
                  label: Text(
                    "All User Block Account".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
              ],
            ),

            // Sellers Activation and Block Account Button.

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  // Sellers Activate Button.

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 30,
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  icon: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  label: Text(
                    "All Activated Sellers AccountS".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),

                // Sellers Diactivation Account Button.
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 30,
                    ),
                    backgroundColor: Colors.red,
                  ),
                  icon: const Icon(
                    Icons.block_flipped,
                    color: Colors.white,
                  ),
                  label: Text(
                    "All Blocked Sellers Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
              ],
            ),
            // Riders Activation and Block Account Button.

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  // Riders Activate Button.

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 30,
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  icon: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  label: Text(
                    "All Activated Riders AccountS".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),

                // Riders Diactivation Account Button.
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 30,
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  icon: const Icon(
                    Icons.block_flipped,
                    color: Colors.white,
                  ),
                  label: Text(
                    "All Blocked Riders Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
