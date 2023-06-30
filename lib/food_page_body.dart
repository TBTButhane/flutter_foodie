import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:just_see/dimentions.dart';
import 'package:just_see/food_detail_page.dart';
import 'package:just_see/recommended_foodDetail_page.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print("The  Current value is " + _currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slide section
        Container(
          height: Dimensions.pageViewContainer,
          // color: Colors.red,
          child: PageView.builder(
              itemCount: 10,
              controller: pageController,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () => Get.to(() => Recommended_FoodDetails_Page()),
                    child: _buildPageItem(index));
              }),
        ),
        //Dots
        new DotsIndicator(
          dotsCount: 10,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: Colors.yellow.shade600,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //List of food and images
        SizedBox(height: 15),
        Container(
            margin: EdgeInsets.only(left: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Popular",
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 20)),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Text(".",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Text("Food pairing",
                      style: GoogleFonts.roboto(
                          color: Colors.black38, fontSize: 12)),
                )
              ],
            )),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => FoodDetailsPage());
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //picture section
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/food2.jpg")),
                          borderRadius: BorderRadius.circular(20),
                          color: index.isEven ? Colors.red : Colors.purple,
                        ),
                      ),
                      //Text Container
                      Expanded(
                        child: Container(
                            height: 100,
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                                top: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Chinese Nutritious meal",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                  SizedBox(height: 10),
                                  Text("With Chinese characteristics",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12)),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,
                                          color: Colors.yellow.shade600,
                                          size: 12),
                                      SizedBox(width: 3),
                                      Text("Normal",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black45,
                                              fontSize: 11)),
                                      SizedBox(width: 3),
                                      Icon(Icons.location_pin,
                                          size: 12,
                                          color: Colors.yellow.shade600),
                                      SizedBox(width: 3),
                                      Text("1.7 km",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black45,
                                              fontSize: 11)),
                                      SizedBox(width: 3),
                                      Icon(Icons.timer,
                                          size: 12,
                                          color: Colors.yellow.shade600),
                                      SizedBox(width: 3),
                                      Text("32min",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black45,
                                              fontSize: 11)),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pVCContaintainer,
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food1.jpg")),
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? Colors.blue.shade400
                    : Colors.yellow.shade600),
            child: Center(child: Text(index.toString())),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewContainerText,
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 0,
                          offset: Offset(-5, 0)),
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 5.0,
                          offset: Offset(5, 0))
                    ],
                    color: Colors.white),
                child: Container(
                    padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Chinese Side",
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
                                        size: 12,
                                        color: Colors.yellow.shade600)),
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
                            children: [
                              Icon(Icons.circle,
                                  color: Colors.yellow.shade600, size: 15),
                              SizedBox(width: 3),
                              Text("Normal",
                                  style: GoogleFonts.roboto(
                                      color: Colors.black45, fontSize: 12)),
                              SizedBox(width: 10),
                              Icon(Icons.location_pin,
                                  size: 15, color: Colors.yellow.shade600),
                              SizedBox(width: 3),
                              Text("1.7 km",
                                  style: GoogleFonts.roboto(
                                      color: Colors.black45, fontSize: 12)),
                              SizedBox(width: 10),
                              Icon(Icons.timer,
                                  size: 15, color: Colors.yellow.shade600),
                              SizedBox(width: 3),
                              Text("32min",
                                  style: GoogleFonts.roboto(
                                      color: Colors.black45, fontSize: 12)),
                              SizedBox(width: 10)
                            ],
                          )
                        ],
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
