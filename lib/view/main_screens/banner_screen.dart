import 'package:admin_web_panel/view/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        titleMsg: "Upload Banners",
        showBackButton: true,
      ),
    );
  }
}
