import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/controllers/constants.dart';
import 'package:social_app/views/homescreen/detailedproductscreen/detailed_scree.dart';

class Backdrop extends StatefulWidget {
  const Backdrop({Key? key}) : super(key: key);

  @override
  State<Backdrop> createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> {
  final Stream<QuerySnapshot> _backdrop =
      FirebaseFirestore.instance.collection('backdrop').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Backdrops',
                style: FontStyless.poppins23Weight500,
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: _backdrop,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: const CircularProgressIndicator());
                  }
                  return Expanded(
                    child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3 / 3.7,
                        ),
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          // String id = document.id;
                          // data['id'] = id;
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailedProductScreen(data));
                            },
                            child: ProductCard(
                                data['price'].toString(), data['image_url']),
                          );
                        }).toList()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
