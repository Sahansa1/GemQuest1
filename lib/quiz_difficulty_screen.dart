import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'background_wrapper.dart';

class QuizDifficultyScreen extends StatelessWidget {
  final String category; // Receives the selected category

  QuizDifficultyScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Difficulty - $category'),
        backgroundColor: const Color.fromARGB(255, 2, 30, 45),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      body: BackgroundWrapper(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDifficultyButton(context, 'Easy', isLargeScreen),
              const SizedBox(height: 20),
              _buildDifficultyButton(context, 'Medium', isLargeScreen),
              const SizedBox(height: 20),
              _buildDifficultyButton(context, 'Hard', isLargeScreen),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyButton(
      BuildContext context, String difficulty, bool isLargeScreen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(isLargeScreen ? 250 : 150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        foregroundColor: const Color.fromARGB(239, 0, 0, 0),
        elevation: 15,
      ),
      child: Text(
        difficulty,
        style: TextStyle(
          fontSize: isLargeScreen ? 20 : 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(
              category: category, // Pass category
              difficulty: difficulty.toLowerCase(), // Convert to lowercase
            ),
          ),
        );
      },
    );
  }
}
