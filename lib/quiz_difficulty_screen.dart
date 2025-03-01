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
      ),
      body: BackgroundWrapper(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(isLargeScreen ? 250 : 150, 50),
                ),
                child: Text(
                  'Easy',
                  style: TextStyle(fontSize: isLargeScreen ? 20 : 16),
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(isLargeScreen ? 250 : 150, 50),
                ),
                child: Text(
                  'Medium',
                  style: TextStyle(fontSize: isLargeScreen ? 20 : 16),
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(isLargeScreen ? 250 : 150, 50),
                ),
                child: Text(
                  'Hard',
                  style: TextStyle(fontSize: isLargeScreen ? 20 : 16),
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
