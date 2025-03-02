import 'package:flutter/material.dart';
import 'encyclopedia_screen.dart';
import 'quiz_screen.dart';
import 'quiz_difficulty_screen.dart';
import 'gemstone_map_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gem Quest',
                  style: TextStyle(
                    fontSize: isLargeScreen ? 35 : 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Ensure the title is visible
                  ),
                  textAlign: TextAlign.center, // Centering the title
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(isLargeScreen ? 250 : 150, 50),
                  ),
                  child: Text('Encyclopedia',
                      style: TextStyle(fontSize: isLargeScreen ? 20 : 16)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EncyclopediaScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(isLargeScreen ? 250 : 150, 50),
                  ),
                  child: Text('Take the Quiz',
                      style: TextStyle(fontSize: isLargeScreen ? 20 : 16)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizDifficultyScreen()),
                    );
                  },
                ),
                SizedBox(height: 20),
                // New Button: Go to Location Map
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(isLargeScreen ? 250 : 150, 50),
                  ),
                  child: Text('View Gemstone Locations',
                      style: TextStyle(fontSize: isLargeScreen ? 20 : 16)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GemstoneMapScreen(), // Navigate to the Map Screen
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
