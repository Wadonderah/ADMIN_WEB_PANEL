import 'package:admin_web_panel/view/main_screens/home_screen.dart';
import 'package:flutter/material.dart';

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
      automaticallyImplyLeading: showBackButton,s
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
              icon: const Icon(Icons.arrow_back, color: Colors.white),
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
          fontSize: 20.0,
          letterSpacing: 3.0,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => bottom == null
      ? const Size.fromHeight(kToolbarHeight)
      : Size.fromHeight(bottom!.preferredSize.height);
}
