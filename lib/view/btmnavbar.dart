import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/view/favorite.dart';
import 'package:ecommerce_app/view/homepage.dart';
import 'package:ecommerce_app/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtmNavbar extends StatefulWidget {
  const BtmNavbar({Key? key}) : super(key: key);

  @override
  State<BtmNavbar> createState() => _BtmNavbarState();
}

class _BtmNavbarState extends State<BtmNavbar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screen = [
    const Homepage(),
    const Profile(),
  ];
  final items = <Widget>[
    const Icon(Icons.home, size: 30),
    const Icon(Icons.person, size: 30),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ClipRRect(
        child: Scaffold(
          body: screen[index],
          bottomNavigationBar: CurvedNavigationBar(
            key: navigationKey,
            items: items,
            index: index,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) {
              setState(() {
                this.index = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
