import 'package:flutter/material.dart';
import 'package:weatherapp/controllers/get%20controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp/functions.dart';
import '../DataBase/DBHelper.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  DBHelper dbHelper = DBHelper();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DataController>(
        init: DataController(),
        builder: (controller) => SafeArea(
          child: GetBuilder(
            init: DataController(),
            builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: ListView(
                children: [
                  TextField(
                    controller: textEditingController,
                    onSubmitted: (text) {
                      search(text, context);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      hintText: 'Enter City Name',
                      labelText: 'Search',
                      suffixIcon: IconButton(
                        onPressed: () {
                          search(textEditingController.text, context);
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  const Text(
                    'Quick access cities',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: TextField(
                                onSubmitted: (text) {
                                  dbHelper.insertItem(
                                    'cities',
                                    {'city': text},
                                  );
                                  controller.buildList();
                                  Get.back();
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 30),
                                  hintText: 'Enter City Name',
                                  labelText: 'Add City',
                                ),
                              ),
                            ),
                            backgroundColor: Colors.white,
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          dbHelper.deleteData('cities');
                          controller.buildList();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                      itemCount: controller.cities.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            onTap: () {
                              search(controller.cities[index]['city'], context);
                            },
                            leading: Text(
                              controller.cities[index]['city'].toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                dbHelper.deleteItem(
                                    controller.cities[index]['id'], 'cities');
                                controller.buildList();
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 25,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
