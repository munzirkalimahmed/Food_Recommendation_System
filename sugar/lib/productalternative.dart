import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'user.dart'; // Import ProfileSetupScreen

class Productalternative extends StatefulWidget {
  const Productalternative({Key? key});

  @override
  State<Productalternative> createState() => _ProductalternativeState();
}

class _ProductalternativeState extends State<Productalternative> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Alternative'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Product Alternative',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 175,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFDFF5FF),
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
                          color: Colors.white,
                          child: Placeholder(),
                        ),
                        SizedBox(width: 20),
                        Expanded(
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
                  ],
                ),
              ),
              SizedBox(height: 30),
              const Text(
                'Available Alternatives',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFDFF5FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MiniBoxRow(
                      children: [
                        MiniBox(name: 'Alternative 1', color: Colors.lightBlue.shade200),
                        MiniBox(name: 'Alternative 2', color: Colors.lightBlue.shade200),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MiniBoxRow(
                      children: [
                        MiniBox(name: 'Alternative 3', color: Colors.lightBlue.shade200),
                        MiniBox(name: 'Alternative 4', color: Colors.lightBlue.shade200),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
            label: 'User',
          ),
        ],
        currentIndex: 1, // Set the index of the Barcode Scanner item
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black, // Set unselected item color
        selectedLabelStyle: TextStyle(color: Colors.lightBlue), // Set selected label color
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homescreen()),
            );
          } else if (index == 1) {
            // Navigate to Barcode Scanner screen
          } else if (index == 2) {
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

class MiniBoxRow extends StatelessWidget {
  final List<Widget> children;

  const MiniBoxRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}

class MiniBox extends StatelessWidget {
  final String name;
  final Color color;

  const MiniBox({required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
