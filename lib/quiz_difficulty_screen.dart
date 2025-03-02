import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'background_wrapper.dart';

class QuizDifficultyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Quiz Difficulty'),
        backgroundColor: const Color.fromARGB(255, 187, 187, 187),
      ),
      body: BackgroundWrapper(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
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
                  'Easy',
                  style: TextStyle(
                      fontSize: isLargeScreen ? 20 : 16,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(difficulty: 'easy'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(isLargeScreen ? 250 : 150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color.fromARGB(255, 246, 246, 246),
                  foregroundColor: const Color.fromARGB(239, 0, 0, 0),
                  elevation: 15,
                ),
                child: Text(
                  'Medium',
                  style: TextStyle(
                      fontSize: isLargeScreen ? 20 : 16,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(difficulty: 'medium'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(isLargeScreen ? 250 : 150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color.fromARGB(255, 246, 246, 246),
                  foregroundColor: const Color.fromARGB(239, 0, 0, 0),
                  elevation: 15,
                ),
                child: Text(
                  'Hard',
                  style: TextStyle(
                      fontSize: isLargeScreen ? 20 : 16,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(difficulty: 'hard'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
