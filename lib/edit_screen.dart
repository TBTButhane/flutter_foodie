// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_see/Controllers/homeScrenController.dart';
import 'package:just_see/models/name_model.dart';

class MiniScreen extends StatefulWidget {
  MiniScreen({Key? key, required this.user}) : super(key: key);
  NameModel user;

  @override
  State<MiniScreen> createState() => _MiniScreenState();
}

class _MiniScreenState extends State<MiniScreen> {
  final HomeScreenController jack = Get.put(HomeScreenController());

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.amber,
                      elevation: 5.0,
                      child: Column(
                        children: [
                          Text("Edit user"),
                          Form(
                            child: TextFormField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                  labelText: '${widget.user.name}',
                                  hintText: '${widget.user.name}'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            child: Text("Save"),
                            onPressed: () async {
                              final updateUser = NameModel(
                                  id: this.widget.user.id,
                                  name: textEditingController.text);
                              final user = updateUser;
                              await jack.updateUser(user);

                              textEditingController.clear();
                              setState(() {
                                this.widget.user = user;
                              });
                              jack.showAll();
                              print("Saved");
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  });
            },
            child: Icon(Icons.edit),
          ),
          ElevatedButton(
            onPressed: () {
              final deleteCurrentUser = widget.user;
              jack.deleteUser(deleteCurrentUser);
              jack.showAll();
              Get.back();
            },
            child: Icon(Icons.delete),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "You clicked on this ${widget.user.name} with ID: ${widget.user.id}")
            ],
          ),
        ),
      ),
    );
  }
}
