import 'package:flutter/material.dart';
import 'package:weatherapp/get%20controller.dart';
import 'package:weatherapp/models/weather%20model.dart';
import 'package:get/get.dart';
import 'search page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

   sets() {
        setState(() {
        });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  Padding rowBuilder({required String avgTe, required String icona, required String dayDate, required String cond}){
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(dayDate,style: const TextStyle(color: Colors.white,fontSize: 20,),),
          Container(
            height: 25,
            width: 25,
            child: Image.network('***************'),
          ),
          Text(cond,style: const TextStyle(color: Colors.white,fontSize: 20,),),
          Text(avgTe,style: const TextStyle(color: Colors.white,fontSize: 20,),),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(42, 60, 93, 1.0),
      body: SafeArea(
       child: GetBuilder<DataController>(
         init: DataController(),
         builder: (controller)=> controller.weatherModel == null?
         Center(
           child: IconButton(
             onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchPage(),),),
             icon: const Icon(Icons.add),

           ),
         ):
         Container(
           decoration: const BoxDecoration(
             gradient: LinearGradient(
               colors: [
                 Color.fromRGBO(42, 60, 93, 1.0),
                 Colors.black,
               ],
               begin: Alignment.topRight,
               end: Alignment.bottomLeft,
             ),
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
                     Text(
                       '${controller.weatherModel!.cityName}',
                       style: const TextStyle(
                         fontSize: 35,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),
                     ),
                     const SizedBox(width: 30,),
                     IconButton(
                       onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchPage(),),),
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
                   child: Image.network('https:${controller.weatherModel!.dayConditionIcon}'),
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
                 const SizedBox(height: 10),
                 Text(
                   controller.weatherModel!.dayConditionName,
                   style: const TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w400,
                     color: Colors.white,
                   ),
                 ),
                 const SizedBox(height: 20),
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
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     color: Colors.blue.withOpacity(0.3),
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Row(
                         children: list.map((value) {
                           return Container(
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 10, vertical: 5),
                             height: 150,
                             width: 70,
                             decoration: BoxDecoration(),
                             child: Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(
                                     bottom: 10,
                                   ),
                                   child: Text(
                                     '2-2',
                                     style: TextStyle(
                                         fontSize: 25,
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold),
                                   ),
                                 ),
                                 Expanded(
                                   child: Image.network('src'),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(
                                     top: 10,
                                   ),
                                   child: Text(
                                     '22',
                                     style: TextStyle(
                                         fontSize: 25,
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold),
                                   ),
                                 ),
                               ],
                             ),
                           );
                         }).toList(),
                       )),
                 ),
                 const SizedBox(height: 60),
                 Container(
                   decoration: BoxDecoration(
                     color: const Color.fromRGBO(49, 72, 114, 1.0),
                     border: Border.all(
                       color: Colors.black,
                       width: 2,
                     ),
                     borderRadius: BorderRadius.circular(20),
                   ),
                   width: MediaQuery.of(context).size.width*0.95,
                   height: 300,
                   child: ListView.builder(itemCount: list.length,
                     itemBuilder: (context,index){
                       return Column(
                         children: [
                           rowBuilder(avgTe: '44', icona: '********************', dayDate: '15/5', cond: 'Clear'),
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

       )
         )





    );
  }
}
