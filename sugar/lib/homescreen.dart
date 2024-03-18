import 'package:flutter/material.dart';
import 'package:sugar/history.dart';
import 'package:sugar/user.dart';
import 'scan.dart';
import 'recommend_exercise.dart'; // Import the file where the recommendation for exercise is defined

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String dropdownValue = 'Option 1'; // Initial value for dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sweet Sense'),
        centerTitle: true,
        backgroundColor: Color(0xFF67C6E3),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle action on selection
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Option1',
                child: Text('Help'),
              ),
              const PopupMenuItem<String>(
                value: 'Option1',
                child: Text('Setting'),
              ),
              const PopupMenuItem<String>(
                value: 'Option2',
                child: Text('Logout'),
              ),
              // Add more options as needed
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF67C6E3),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Arslan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('User Profile'),
              onTap: () {
                // Navigate to the user page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSetupScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('History'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
            ),
            // Add more list items as needed
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFDFF5FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.only(top: 20.0),
                height: 210,
                width: 332,
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.visibility, size: 30.0),
                    SizedBox(width: 8),
                    Text('Scan your eye', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to HistoryPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF67C6E3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Rubik Medium',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFDFF5FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 400,
                width: 300,
                // color: Colors.blueGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to RecommendExercisePage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecommendExercisePage()),
                        );
                      },
                      child: _buildIconBox(Icons.sports_gymnastics, 'Exercise\nRoutine'),
                    ),
                    _buildIconBox(Icons.food_bank, 'Healty\nFood'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Barcode Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Color(0xFF378CE7),
        onTap: (index) {
          // Handle navigation
          switch(index) {
            case 0:
            // Navigate to HomeScreen
              break;
            case 1:
            // Navigate to ScanPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scanproduct()),
              );
              break;
            case 2:
            // Navigate to ProfileSetupScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSetupScreen()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildIconBox(IconData iconData, String description) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xFF67C6E3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 40, color: Colors.white),
          SizedBox(height: 8),
          Text(
            description,
            style:TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}