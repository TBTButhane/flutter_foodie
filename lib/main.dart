import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_see/Controllers/popularProductController.dart';
// import 'package:just_see/Controllers/homeScrenController.dart';
import 'package:just_see/Controllers/theme_data.dart';
import 'package:just_see/db/database.dart';
// import 'package:just_see/edit_screen.dart';
import 'package:just_see/main_food_page.dart';
// import 'package:just_see/recommended_foodDetail_page.dart';
import 'util/dependencies.dart' as dep;

// import 'package:just_see/models/name_model.dart';
// import 'package:just_see/profileScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await DatabaseH.instance.getDatabase;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //for test perposes
    Get.find<ProductController>().getProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeSwitcher.light,
      darkTheme: ThemeSwitcher.dark,
      themeMode: ThemeMode.light,
      home: FoodHomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var themeChanger = false;
//   final HomeScreenController hsc = Get.put(HomeScreenController());
//   final ThemeSwitcher themeSwitcher = Get.put(ThemeSwitcher());

//   TextEditingController textEditingController = TextEditingController();
//   void initState() {
//     super.initState();
//     hsc.showAll();

//     print(hsc.users.length);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   Get.to(ProfileScreen());
//                 },
//                 icon: Icon(Icons.remove_red_eye, color: Colors.white))
//           ],
//           title: Text(widget.title),
//           leading: IconButton(
//               onPressed: () {
//                 setState(() {
//                   themeChanger = false;
//                 });
//               },
//               icon: themeChanger != themeChanger
//                   ? Icon(Icons.night_shelter)
//                   : Icon(Icons.surfing))),
//       body: Obx(() => hsc.users.isEmpty
//           ? Center(
//               child: Text("Sorry you have zero users :(",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
//             )
//           : Column(
//               children: [
//                 Container(
//                     child: Text("Total Users: " + hsc.users.length.toString())),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Column(
//                       children: [
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8.0),
//                               child:
//                                   Text("${hsc.users[index].name.capitalize}"),
//                             ),
//                             SizedBox(
//                               width: 150,
//                             ),
//                             IconButton(
//                                 onPressed: () {
//                                   Get.to(() => MiniScreen(
//                                         user: hsc.users[index],
//                                       ));
//                                 },
//                                 icon: Icon(Icons.edit)),
//                             IconButton(
//                                 onPressed: () {
//                                   hsc.deleteUser(hsc.users[index]);

//                                   hsc.showAll();
//                                 },
//                                 icon: Icon(Icons.delete))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                       ],
//                     );
//                   },
//                   itemCount: hsc.users.length,
//                 ),
//               ],
//             )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return Dialog(
//                   backgroundColor: Colors.amber,
//                   elevation: 5.0,
//                   child: Column(
//                     children: [
//                       Text("Enter Your Name"),
//                       Form(
//                         child: TextFormField(
//                           controller: textEditingController,
//                           decoration: InputDecoration(
//                               labelText: 'Enter Your Name',
//                               hintText: 'Name Please'),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       ElevatedButton(
//                         child: Text("Save"),
//                         onPressed: () {
//                           _addUser();

//                           textEditingController.clear();
//                           print("Saved");
//                           Navigator.pop(context);
//                           setState(() {});
//                         },
//                       )
//                     ],
//                   ),
//                 );
//               });
//           hsc.showAll();
//           print(hsc.users.length);
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   _addUser() async {
//     int value = await hsc.createUser(
//         nameModel: NameModel(name: textEditingController.text));
//     print("my id: $value");
//   }
// }
