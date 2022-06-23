import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/controllers/constants.dart';
import 'package:social_app/views/auth/profile_screen.dart';
import 'package:social_app/views/homescreen/categories/backdrops.dart';
import 'package:social_app/views/homescreen/categories/birthboxes.dart';
import 'package:social_app/views/homescreen/categories/caketopper.dart';
import 'package:social_app/views/homescreen/categories/frames.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => ProfileScreen());
          },
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(30), // Image radius
              child:
                  Image.asset('assets/images/printasy.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              left: 20,
              top: 20,
              child: Text(
                'Our Products',
                style: FontStyless.poppins23Weight500,
              ),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[200],
                  onPrimary: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {},
                child: Text('Sort By'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const Backdrop());
                      },
                      child: CatergoryCard('Backdrops', 'assets/images/3.jpg')),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const CakeTopper());
                      },
                      child: CatergoryCard(
                          'Cake Topper', 'assets/images/topper.jpg')),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => BirthBoxes(), transition: Transition.fade);
                      },
                      child: CatergoryCard(
                          'Birth Boxes', 'assets/images/birthbox.jpg')),
                  CatergoryCard('Stickers', 'assets/images/stickers.png'),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const Frames());
                      },
                      child:
                          CatergoryCard('Frames', 'assets/images/frame.jpg')),
                  CatergoryCard('Tissue Boxes', 'assets/images/tissue.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
