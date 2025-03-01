import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'easyQuestionList.dart';
import 'hardQuestionList.dart';
import 'mediumQuestionList.dart';
import 'quiz.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String difficulty;

  QuizScreen({required this.difficulty});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizQuestion> selectedQuestions = [];
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    switch (widget.difficulty) {
      case 'easy':
        selectedQuestions = easyQuestions;
        break;
      case 'medium':
        selectedQuestions = mediumQuestions;
        break;
      case 'hard':
        selectedQuestions = hardQuestions;
        break;
      default:
        selectedQuestions = easyQuestions; // Default to easy if no difficulty provided
    }
  }

  void answerQuestion(int selectedIndex) {
    if (selectedIndex == selectedQuestions[currentQuestionIndex].correctAnswerIndex) {
      score++;
      // Show the Lottie animation dialog
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent dismissal by tapping outside
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent, // Make the dialog background transparent
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/animations/answer_correct_anim.json', // Path to your Lottie file
                  width: 200,
                  height: 200,
                  repeat: false,
                ),
                SizedBox(height: 16),
                Text(
                  'Correct Answer!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          );
        },
      );

      // Delay to show the animation before moving to the next question
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context); // Close the dialog
        setState(() {
          currentQuestionIndex++;
        });

        // Check if quiz is complete
        if (currentQuestionIndex >= selectedQuestions.length) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ResultScreen(score: score, totalQuestions: selectedQuestions.length),
            ),
          );
        }
      });
    } else {
      // Incorrect answer - proceed to next question
      setState(() {
        currentQuestionIndex++;
      });
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent dismissal by tapping outside
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent, // Make the dialog background transparent
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/animations/asnwer_wrong_anim.json', // Path to your Lottie file
                  width: 200,
                  height: 200,
                  repeat: false,
                ),
                SizedBox(height: 16),
                Text(
                  'Wrong Answer!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
          );
        },
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context); // Close the dialog
        setState(() {
          currentQuestionIndex++;
        });

        // Check if quiz is complete
        if (currentQuestionIndex >= selectedQuestions.length) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ResultScreen(score: score, totalQuestions: selectedQuestions.length),
            ),
          );
        }
      });

      if (currentQuestionIndex >= selectedQuestions.length) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResultScreen(score: score, totalQuestions: selectedQuestions.length),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gem Quiz - ${widget.difficulty}'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/questions_backg.jpg', // Path to your background image
              fit: BoxFit.cover, // Ensure the image covers the screen completely
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: currentQuestionIndex < selectedQuestions.length
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Question ${currentQuestionIndex + 1}/${selectedQuestions.length}',
                      style: TextStyle(fontSize: isLargeScreen ? 22 : 18),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      selectedQuestions[currentQuestionIndex].question,
                      style: TextStyle(
                          fontSize: isLargeScreen ? 24 : 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center, // Center the question text
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Column(
                      children: List.generate(
                        selectedQuestions[currentQuestionIndex].answers.length,
                            (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  isLargeScreen ? screenWidth * 0.5 : screenWidth * 0.8, 50),
                            ),
                            child: Text(
                              selectedQuestions[currentQuestionIndex].answers[index],
                              style: TextStyle(fontSize: isLargeScreen ? 20 : 16),
                            ),
                            onPressed: () => answerQuestion(index),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
