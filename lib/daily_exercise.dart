import 'package:flutter/material.dart';

class DailyExercisesPage extends StatefulWidget {
  DailyExercisesPage({super.key});

  @override
  State<DailyExercisesPage> createState() => _DailyExercisesPageState();
}

class _DailyExercisesPageState extends State<DailyExercisesPage> {
  TextEditingController exercise = TextEditingController() ;
  TextEditingController date = TextEditingController() ;

  List<String> exerNames = [
    'Chest Exercises 8',
    'Back Exercises 6',
    'Biceps Exercises 8',
    'Shoulder Exercises 7',
    'Legs Exercises 8'
  ];
  List<String> exerImages = [
    'assets/main1.jpg',
    'assets/main2.jpg',
    'assets/main3.jpg',
    'assets/main1.jpg',
    'assets/main5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            height: 210,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                height: 190,
                width: 385,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Add new exercise today',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'dialyfont',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title:Text("Enter New Exercise" ,style: TextStyle(
                                    color: Colors.green,fontSize: 30,fontWeight: FontWeight.w500
                                ),),
                                backgroundColor: Colors.black,
                                content: Column(
                                  mainAxisSize:MainAxisSize.min,
                                  children: [
                                    TextFormField(controller:exercise,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide:BorderSide(color: Colors.grey),
                                              borderRadius: BorderRadius.all(Radius.circular(15))

                                          ),
                                          hintText: 'Exerices',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          )
                                      ) ,),
                                    TextFormField(controller:date,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide:BorderSide(color: Colors.grey),
                                              borderRadius: BorderRadius.all(Radius.circular(15))
                                          ),
                                          hintText: 'Date',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          )
                                      ) ,),


                                  ],
                                ),

                              );

                            },
                          );


                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/add.gif'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded (
            child: ListView.builder(
              itemCount: exerNames.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(
                            exerImages[index],
                            fit: BoxFit.cover, // Make the image cover the entire container
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                exerNames[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily:'dialyfont' ,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}