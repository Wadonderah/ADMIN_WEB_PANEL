import 'package:flutter/material.dart';
import '../home_screen.dart';

// ignore: must_be_immutable
class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  String? titleMsg;
  bool showBackButton;
  PreferredSizeWidget? bottom;

  MyAppbar(
      {super.key,
      required,
      this.titleMsg,
      this.showBackButton = true,
      this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.deepOrange,
                Colors.purple,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
      leading: showBackButton == true
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            )
          : Container(),
      title: Text(
        titleMsg!,
        style: const TextStyle(
          letterSpacing: 3.0,
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
