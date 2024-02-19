import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: menuScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class menuScreen extends StatelessWidget {
  const menuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 229, 227, 227),
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              print("Last Page");
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 25.0,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Search Products",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2264922221.jpg"),
            ),
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 5.5),
                  ),
                  hintText: 'Plants',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  List<String> imgs = [
                    '1.png',
                    '2.png',
                    '3.png',
                    '4.png',
                    '5.png',
                    '6.png',
                  ];

                  List<String> texts = [
                    'Lucky Jade Plant',
                    'Snake Plant',
                    'Peperomia Plant',
                    'Small Plant',
                    'Fig Plant',
                    'Fiddle Leaf Plant',
                  ];

                  return Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(235, 237, 235, 235),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(
                                  'assets/${imgs[index]}'), // Note: 'assets/' instead of 'asset/'
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          texts[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (int index) => StaggeredTile.count(
                    1, index.isEven ? 1.5 : 1), // Adjust as needed
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
