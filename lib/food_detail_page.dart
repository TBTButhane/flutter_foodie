import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_see/widgets/appIcon.dart';
import 'package:just_see/widgets/appIconText.dart';
import 'package:just_see/widgets/food_details_expandedText.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/food3.jpg"))),
              )),
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios_rounded,
                      size: 32,
                      iconColor: Colors.white,
                      backgroundColor: Colors.black87,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    size: 32,
                    iconColor: Colors.white,
                    backgroundColor: Colors.black87,
                  )
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 150,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Chinese Nutritious meal",
                        style: GoogleFonts.roboto(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontSize: 20)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(Icons.star,
                                  size: 12, color: Colors.yellow.shade600)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("4.5",
                            style: GoogleFonts.roboto(
                                color: Colors.black45,
                                fontWeight: FontWeight.w400,
                                fontSize: 12)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("1287",
                            style: GoogleFonts.roboto(
                                color: Colors.black45,
                                fontWeight: FontWeight.w400,
                                fontSize: 12)),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Comments",
                            style: GoogleFonts.roboto(
                                color: Colors.black45,
                                fontWeight: FontWeight.w400,
                                fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppIconAndText(
                          icon: Icons.circle,
                          text: "Normal",
                          iconColr: Colors.yellow.shade600,
                          fontColr: Colors.black45,
                          fontSize: 12,
                          iconSize: 15,
                        ),
                        SizedBox(width: 10),
                        AppIconAndText(
                          icon: Icons.location_pin,
                          text: "1.7 km",
                          iconColr: Colors.yellow.shade600,
                          fontColr: Colors.black45,
                          fontSize: 12,
                          iconSize: 15,
                        ),
                        SizedBox(width: 10),
                        AppIconAndText(
                          icon: Icons.timer,
                          text: "32min",
                          iconColr: Colors.yellow.shade600,
                          fontColr: Colors.black45,
                          fontSize: 12,
                          iconSize: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Introduce",
                        style: GoogleFonts.roboto(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                    SizedBox(height: 2),
                    Expanded(
                        child: SingleChildScrollView(
                      child: FoodExpandedText(
                        text:
                            "Nam interdum quis purus vel feugiat.Nam interdum quis purus vel feugiat.Nam interdum quis purus vel feugiat.Nam interdum quis purus vel feugiat.Nam interdum quis purus vel feugiat.Nam interdum quis purus vel feugiat.Nam interdum quis purus vel feugiat.Nam interdum quis purus vel feugiat.Nam interdum quis purus vel feugiat. Suspendisse malesuada sit amet nisl eget eleifend. Donec pellentesque at lacus ut mattis. Mauris id sollicitudin mi, eu pellentesque neque. Nulla dictum aliquam euismod. Maecenas viverra sagittis pulvinar. Integer. ",
                      ),
                    )),
                    SizedBox(height: 15),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
          height: 100,
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // height: 50,
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcon(
                      icon: Icons.remove,
                    ),
                    SizedBox(width: 3),
                    Text("0",
                        style: GoogleFonts.roboto(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontSize: 20)),
                    SizedBox(width: 3),
                    AppIcon(
                      icon: Icons.add,
                    ),
                  ],
                ),
              ),
              Container(
                // height: 50,
                padding:
                    EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade400),
                child: Text("\$10 | Add to cart",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15)),
              )
            ],
          )),
    );
  }
}
