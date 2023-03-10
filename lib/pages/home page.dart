import 'package:flutter/material.dart';
import 'package:weatherapp/DataBase/DBHelper.dart';
import 'package:weatherapp/controllers/get%20controller.dart';

import 'package:get/get.dart';
import '../services/themes services.dart';
import 'search page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper dbHelper = DBHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper.init();
  }

  bool isDay(String text) {
    String newText = text.split(':')[0].substring(10);
    int d = int.parse(newText);
    if (d <= 12 && d >= 0)
      return true;
    else
      return false;
  }

  Padding rowBuilder(
      {required String avgTe,
      required String icona,
      required String dayDate,
      required String cond}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            dayDate,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.network('https:$icona'),
                ),
                Text(
                  cond,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Text(
            avgTe,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<DataController>(
          init: DataController(),
          builder: (controller) => controller.weatherModel == null
              ? Center(
                  child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'There is no selected city search now!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          controller.buildList();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ),
                          );
                        },
                        child: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ))
              : Container(
                  decoration: BoxDecoration(
                    gradient: isDay(controller.weatherModel!.dayDate)
                        ? ThemeServices.dayGradient
                        : ThemeServices.nightGradient,
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.25),
                            Text(
                              controller.weatherModel!.cityName,
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 30),
                            IconButton(
                              onPressed: () {
                                controller.buildList();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          controller.weatherModel!.dayDate,
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.network(
                              'https:${controller.weatherModel!.dayConditionIcon}'),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          '${controller.weatherModel!.dayAvgTemp}',
                          style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          controller.weatherModel!.dayConditionName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Min temp',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${controller.weatherModel!.dayMinTemp}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(
                                  Icons.air,
                                  color: Colors.white,
                                ),
                                Text(
                                  '${controller.weatherModel!.dayWindSpeed} mph',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Max temp',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${controller.weatherModel!.dayMaxTemp}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: isDay(controller.weatherModel!.dayDate)
                                ? ThemeServices.dayColor
                                : ThemeServices.nightColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListView.builder(
                            itemCount: controller.weatherModel!.hourData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  child: Text(
                                    controller
                                        .weatherModel!.hourData[index]['time']
                                        .toString()
                                        .substring(10),
                                    style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Image.network(
                                    'https:${controller.weatherModel!.hourData[index]['condition']['icon']}'),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    '${controller.weatherModel!.hourData[index]['temp_c']}',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        Container(
                          decoration: BoxDecoration(
                            color: isDay(controller.weatherModel!.dayDate)
                                ? ThemeServices.dayColor
                                : ThemeServices.nightColor,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.weatherModel!.fore.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  rowBuilder(
                                      avgTe:
                                          '${controller.weatherModel!.fore[index]['day']['avgtemp_c']}',
                                      icona:
                                          '${controller.weatherModel!.fore[index]['day']['condition']['icon']}',
                                      dayDate: controller
                                          .weatherModel!.fore[index]['date']
                                          .toString()
                                          .substring(6),
                                      cond:
                                          '${controller.weatherModel!.fore[index]['day']['condition']['text']}'),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
