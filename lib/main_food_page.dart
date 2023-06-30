import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_see/food_page_body.dart';

class FoodHomePage extends StatefulWidget {
  const FoodHomePage({Key? key}) : super(key: key);

  @override
  _FoodHomePageState createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.height;
    print("Your screen size is :$screenSize");
    return Scaffold(
      body: Column(
        children: [
          storeAppBar(),
          Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
  }

  storeAppBar() {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 25, bottom: 15),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Pretoria",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 25)),
              Row(
                children: [
                  Text("Hammanskraal",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.black,
                  )
                ],
              )
            ]),
            Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(child: Icon(Icons.search, color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
