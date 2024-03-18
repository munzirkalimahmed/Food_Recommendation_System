import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart package

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Color(0xFFA0D995),
              value: 25, // Example value
              title: '25%', // Example title
              radius: 25, // Reduced radius
            ),
            PieChartSectionData(
              color: Color(0xFF3EC70B),
              value: 75, // Example value
              title: '75%', // Example title
              radius: 25, // Reduced radius
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserHeader(),
            SizedBox(height: 16.0),
            _buildGlycemicLoad(),
            SizedBox(height: 16.0),
            _buildGlucoseReadings(),
            SizedBox(height: 16.0),
            _buildRecommendationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/profile.jpg'), // Replace with your profile picture
        ),
        SizedBox(width: 16.0),
        Text(
          'Hi Daniel',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildGlycemicLoad() {
    return Container(
      width: double.infinity,
      height: 200.0, // Half of the current height
      padding: EdgeInsets.all(8.0), // Adjust padding
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: Offset(0, 3), // Offset
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Glycemic Load',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          PieChartWidget(),
        ],
      ),
    );
  }

  Widget _buildGlucoseReadings() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 16.0),
      height: 300.0, // Increase the height here
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Average Weekly Glucose Intake',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Center(
            child: Text(
              'Your average weekly glucose intake readings here',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  //

  Widget _buildRecommendationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle recommend food button press
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green[100],
            onPrimary: Colors.black,
            elevation: 2, // Set elevation for the shadow effect
          ),
          child: Text('Recommend Food'),
        ),
        SizedBox(width: 16.0),
        ElevatedButton(
          onPressed: () {
            // Handle recommend exercise button press
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[100],
            foregroundColor: Colors.black,
            elevation: 2, // Set elevation for the shadow effect
          ),
          child: Text('Recommend Exercise'),
        ),
      ],
    );
  }

}

void main() {
  runApp(MaterialApp(
    home: HistoryPage(),
  ));
}
