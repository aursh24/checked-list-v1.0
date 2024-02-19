import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: CardWidget(),
      debugShowCheckedModeBanner: false,
    ));

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print("Opening Cart");
            },
            icon: Icon(
              Icons.add_shopping_cart,
              size: 25.0,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            print("Last Page");
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 25.0,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              "https://media.istockphoto.com/id/1372896722/photo/potted-banana-plant-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=bioeNAo7zEqALK6jvyGlxeP_Y7h6j0QjuWbwY4E_eP8=",
              height: 300,
              width: 350,
            ),
            SizedBox(height: 5.0),
            Text(
              "Banana-Plant",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "The banana plant, belonging to the Musa genus, is a large herbaceous plant native to Southeast Asia.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey[620],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Card(
                    color: const Color.fromARGB(255, 16, 181, 21),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            //Row 1
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(23.0),
                                child: Column(children: [
                                  // Row 1 Column 1
                                  Icon(Icons.height_rounded,
                                      color: const Color.fromARGB(
                                          255, 211, 207, 207),
                                      size: 25),
                                  SizedBox(height: 1.0),
                                  Text(
                                    "Height",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.0,
                                  ),
                                  Text(
                                    "30cm - 40cm",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey[100]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                  ),
                                ]),
                              ),

                              Spacer(),

                              Padding(
                                padding: const EdgeInsets.all(23.0),
                                child: Column(children: [
                                  // Row 1 Column 1
                                  Icon(Icons.height_rounded,
                                      color: const Color.fromARGB(
                                          255, 211, 207, 207),
                                      size: 25),
                                  SizedBox(
                                    height: 1.0,
                                  ),
                                  Text(
                                    "Temperature",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 1.0),
                                  Text(
                                    "25C-40C",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey[100]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                  ),
                                ]),
                              ),
                              Spacer(), // Row 1 Col 2

                              Padding(
                                padding: const EdgeInsets.all(23.0),
                                child: Column(children: [
                                  // Row 1 Column 1
                                  Icon(Icons.add_box_outlined,
                                      color: Color.fromARGB(255, 211, 207, 207),
                                      size: 25),
                                  SizedBox(height: 1.0),
                                  Text(
                                    "Pot",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 1.0),
                                  Text(
                                    "Ciramic Pot",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey[100]),
                                  ),
                                  SizedBox(height: 1.0),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                  ),
                                ]),
                              ),
                            ], //Row 1 Col 3
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    // Row 2 Column 1,
                                    Text(
                                      "Total Price",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "\$12.99",
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                    ),
                                  ]),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(100, 0, 35, 35),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.5),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print("Added To Cart");
                                        },
                                        child: Text("Add To Cart"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.5),
                                          ),
                                          backgroundColor: Colors.green[860],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
