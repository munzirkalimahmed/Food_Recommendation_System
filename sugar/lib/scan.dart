import 'package:flutter/material.dart';
import 'package:sugar/recommend_exercise.dart';
import 'homescreen.dart'; // Import the homescreen.dart file
import 'productalternative.dart'; // Import the product_alternative.dart file
import 'user.dart'; // Import the user.dart file
import 'recommend_exercise.dart'; // Import the recommend_excercise.dart file

class Scanproduct extends StatefulWidget {
  const Scanproduct({Key? key}) : super(key: key);

  @override
  State<Scanproduct> createState() => _ScanproductState();
}

class _ScanproductState extends State<Scanproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Scanned'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 500,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 125,
                        height: 125,
                        color: Colors.white, // You can replace this with an image
                        // child: Placeholder(), // Uncomment this line and remove the color to use a placeholder
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Text(
                          'Product Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Ingredients: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add space between main container and boxes
            GestureDetector(
              onTap: () {
                // Navigate to Product Alternative screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Productalternative()),
                );
              },
              child: Container(
                width: 300,
                height: 50,
                color: Colors.blue, // Adjust color as needed
                child: const Center(
                  child: Text(
                    'Product Alternative',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add space between boxes
            GestureDetector(
              onTap: () {
                // Navigate to Recommend Exercise screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecommendExercisePage()),
                );
              },
              child: Container(
                width: 300,
                height: 50,
                color: Colors.green, // Adjust color as needed
                child:const Center(
                  child: Text(
                    'Suggest Exercise',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code,
              color: Color(0xFF67C6E3),
            ), // Change color to orangeAccent
            label: 'Barcode Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: 1, // Set current index to 1 for home
        selectedItemColor:Color(0xFF67C6E3),
        onTap: (index) {
          if (index == 0) {
            // Navigate to the homescreen.dart file
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homescreen()),
            );
          } else if (index == 1) {
            // Navigate to Barcode Scanner screen
          } else if (index == 2) {
            // Navigate to User screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileSetupScreen()),
            );
          }
        },
      ),
    );
  }
}
