import 'package:flutter/material.dart';

class FontStyless {
  static TextStyle poppinssizeBold30 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );
  static TextStyle poppins23Weight500 = const TextStyle(
      fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 23);
  static TextStyle poppinsColorGrey = const TextStyle(
    fontFamily: "Poppins",
    color: Colors.grey,
  );
  static TextStyle poppinsColorbalck = const TextStyle(
    fontFamily: "Poppins",
    color: Colors.black,
  );
  static TextStyle poppinsRegualr = const TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w300,
  );
  static TextStyle poppinsSemiBold = const TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w300,
  );
  static TextStyle loginFont = const TextStyle(
    fontSize: 23,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
  );
  static TextStyle usernamefont =
      TextStyle(fontFamily: "Poppins", color: Colors.grey);
}

class MyTextField extends StatelessWidget {
  String hintText;
  Icon? prefixIcon;
  IconButton? suffixIcon;
  bool obsecureText;
  EdgeInsetsGeometry? contentPadding;
  final TextEditingController controller;
  MyTextField({
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.obsecureText,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15.0),
        ),
        contentPadding: contentPadding,
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  String text;
  Function onPressed;

  Size? buttonSize;
  MyButton({
    required this.text,
    required this.onPressed,
    this.buttonSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          fixedSize: buttonSize,
          shape: const StadiumBorder(
            side: BorderSide.none,
          ),
        ),
        onPressed: onPressed(),
        child: Text(text));
  }
}

class CatergoryCard extends StatefulWidget {
  String text;
  String images;
  CatergoryCard(this.text, this.images);

  @override
  State<CatergoryCard> createState() => _CatergoryCardState();
}

class _CatergoryCardState extends State<CatergoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image.asset(
              widget.images,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.text,
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  String text;
  String image;
  ProductCard(this.text, this.image);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      height: MediaQuery.of(context).size.height / 3.2,
      // color: Colors.black,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide.none,
        ),
        child: Column(
          children: [
            Image.network(
              widget.image,
              width: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Rs :',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add To Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
