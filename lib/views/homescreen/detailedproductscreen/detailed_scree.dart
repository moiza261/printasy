import 'package:flutter/material.dart';

class DetailedProductScreen extends StatefulWidget {
  Map data;
  DetailedProductScreen(this.data);

  @override
  State<DetailedProductScreen> createState() => _DetailedProductScreenState();
}

class _DetailedProductScreenState extends State<DetailedProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 50),
                  // color: Colors.red,
                  height: 450,
                  alignment: Alignment.center,
                  child: Image(
                    image: NetworkImage(widget.data['image_url']),
                  )),
              const Positioned(
                bottom: 330,
                left: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Product Name',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                bottom: 290,
                left: 10,
                right: 10,
                child: SizedBox(
                  width: 500,
                  child: Text(
                    widget.data['product_name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 250,
                left: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Product Description',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                bottom: 170,
                left: 10,
                right: 10,
                child: SizedBox(
                  width: 500,
                  child: Text(
                    widget.data['product_description'],
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 130,
                left: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Product Price',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Rs : ',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                      ),
                      Text(
                        widget.data['price'].toString(),
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(405, 50),
                  ),
                  onPressed: () {},
                  child: Text('Add To Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
