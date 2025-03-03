// // import 'package:flutter/material.dart';
// // import 'package:lottie/lottie.dart';
// // import 'easyQuestionList.dart';
// // import 'hardQuestionList.dart';
// // import 'mediumQuestionList.dart';
// // import 'quiz.dart';
// // import 'result_screen.dart';

// // class QuizScreen extends StatefulWidget {
// //   final String difficulty;

// //   QuizScreen({required this.difficulty});

// //   @override
// //   _QuizScreenState createState() => _QuizScreenState();
// // }

// // class _QuizScreenState extends State<QuizScreen> {
// //   List<QuizQuestion> selectedQuestions = [];
// //   int currentQuestionIndex = 0;
// //   int score = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     switch (widget.difficulty) {
// //       case 'easy':
// //         selectedQuestions = easyQuestions;
// //         break;
// //       case 'medium':
// //         selectedQuestions = mediumQuestions;
// //         break;
// //       case 'hard':
// //         selectedQuestions = hardQuestions;
// //         break;
// //       default:
// //         selectedQuestions = easyQuestions; // Default to easy if no difficulty provided
// //     }
// //   }

// //   void answerQuestion(int selectedIndex) {
// //     if (selectedIndex == selectedQuestions[currentQuestionIndex].correctAnswerIndex) {
// //       score++;
// //       // Show the Lottie animation dialog
// //       showDialog(
// //         context: context,
// //         barrierDismissible: false, // Prevent dismissal by tapping outside
// //         builder: (BuildContext context) {
// //           return AlertDialog(
// //             backgroundColor: Colors.transparent, // Make the dialog background transparent
// //             content: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Lottie.asset(
// //                   'assets/animations/answer_correct_anim.json', // Path to your Lottie file
// //                   width: 200,
// //                   height: 200,
// //                   repeat: false,
// //                 ),
// //                 SizedBox(height: 16),
// //                 Text(
// //                   'Correct Answer!',
// //                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       );

// //       // Delay to show the animation before moving to the next question
// //       Future.delayed(Duration(seconds: 2), () {
// //         Navigator.pop(context); // Close the dialog
// //         setState(() {
// //           currentQuestionIndex++;
// //         });

// //         // Check if quiz is complete
// //         if (currentQuestionIndex >= selectedQuestions.length) {
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) =>
// //                   ResultScreen(score: score, totalQuestions: selectedQuestions.length),
// //             ),
// //           );
// //         }
// //       });
// //     } else {
// //       // Incorrect answer - proceed to next question
// //       setState(() {
// //         currentQuestionIndex++;
// //       });
// //       showDialog(
// //         context: context,
// //         barrierDismissible: false, // Prevent dismissal by tapping outside
// //         builder: (BuildContext context) {
// //           return AlertDialog(
// //             backgroundColor: Colors.transparent, // Make the dialog background transparent
// //             content: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Lottie.asset(
// //                   'assets/animations/asnwer_wrong_anim.json', // Path to your Lottie file
// //                   width: 200,
// //                   height: 200,
// //                   repeat: false,
// //                 ),
// //                 SizedBox(height: 16),
// //                 Text(
// //                   'Wrong Answer!',
// //                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       );

// //       Future.delayed(Duration(seconds: 2), () {
// //         Navigator.pop(context); // Close the dialog
// //         setState(() {
// //           currentQuestionIndex++;
// //         });

// //         // Check if quiz is complete
// //         if (currentQuestionIndex >= selectedQuestions.length) {
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) =>
// //                   ResultScreen(score: score, totalQuestions: selectedQuestions.length),
// //             ),
// //           );
// //         }
// //       });

// //       if (currentQuestionIndex >= selectedQuestions.length) {
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) =>
// //                 ResultScreen(score: score, totalQuestions: selectedQuestions.length),
// //           ),
// //         );
// //       }
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var screenWidth = MediaQuery.of(context).size.width;
// //     var screenHeight = MediaQuery.of(context).size.height;
// //     var isLargeScreen = screenWidth > 600;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Gem Quiz - ${widget.difficulty}'),
// //       ),
// //       body: Stack(
// //         children: [
// //           Positioned.fill(
// //             child: Image.asset(
// //               'assets/images/questions_backg.jpg', // Path to your background image
// //               fit: BoxFit.cover, // Ensure the image covers the screen completely
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Center(
// //               child: Container(
// //                 padding: const EdgeInsets.all(16.0),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white60,
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //                 child: currentQuestionIndex < selectedQuestions.length
// //                     ? Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     Text(
// //                       'Question ${currentQuestionIndex + 1}/${selectedQuestions.length}',
// //                       style: TextStyle(fontSize: isLargeScreen ? 22 : 18),
// //                     ),
// //                     SizedBox(height: screenHeight * 0.02),
// //                     Text(
// //                       selectedQuestions[currentQuestionIndex].question,
// //                       style: TextStyle(
// //                           fontSize: isLargeScreen ? 24 : 20,
// //                           color: Colors.black,
// //                           fontWeight: FontWeight.bold),
// //                       textAlign: TextAlign.center, // Center the question text
// //                     ),
// //                     SizedBox(height: screenHeight * 0.02),
// //                     Column(
// //                       children: List.generate(
// //                         selectedQuestions[currentQuestionIndex].answers.length,
// //                             (index) => Padding(
// //                           padding: const EdgeInsets.symmetric(vertical: 8.0),
// //                           child: ElevatedButton(
// //                             style: ElevatedButton.styleFrom(
// //                               minimumSize: Size(
// //                                   isLargeScreen ? screenWidth * 0.5 : screenWidth * 0.8, 50),
// //                             ),
// //                             child: Text(
// //                               selectedQuestions[currentQuestionIndex].answers[index],
// //                               style: TextStyle(fontSize: isLargeScreen ? 20 : 16),
// //                             ),
// //                             onPressed: () => answerQuestion(index),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 )
// //                     : Center(child: CircularProgressIndicator()),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'easyQuestionList.dart';
// import 'mediumQuestionList.dart';
// import 'hardQuestionList.dart';
// import 'quiz.dart';
// import 'result_screen.dart';

// class QuizScreen extends StatefulWidget {
//   final String difficulty;

//   QuizScreen({required this.difficulty});

//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   List<QuizQuestion> selectedQuestions = [];
//   int currentQuestionIndex = 0;
//   int score = 0;
//   bool isAnswered = false; // Prevents multiple taps
//   List<String> shuffledAnswers = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadQuestions();
//     _shuffleAnswers();
//   }

//   void _loadQuestions() {
//     switch (widget.difficulty) {
//       case 'easy':
//         selectedQuestions = List.from(easyQuestions);
//         break;
//       case 'medium':
//         selectedQuestions = List.from(mediumQuestions);
//         break;
//       case 'hard':
//         selectedQuestions = List.from(hardQuestions);
//         break;
//       default:
//         selectedQuestions = List.from(easyQuestions);
//     }
//   }

//   void _shuffleAnswers() {
//     shuffledAnswers =
//         List.from(selectedQuestions[currentQuestionIndex].answers);
//     shuffledAnswers.shuffle();
//   }

//   void answerQuestion(String selectedAnswer) {
//     if (isAnswered) return; // Prevent multiple clicks
//     setState(() => isAnswered = true);

//     bool isCorrect = selectedAnswer ==
//         selectedQuestions[currentQuestionIndex].answers[
//             selectedQuestions[currentQuestionIndex].correctAnswerIndex];

//     if (isCorrect) {
//       score++;
//       _showLottieDialog('assets/animations/answer_correct_anim.json',
//           'Correct!', Colors.green);
//     } else {
//       _showLottieDialog(
//           'assets/animations/asnwer_wrong_anim.json', 'Wrong!', Colors.red);
//     }
//   }

//   void _showLottieDialog(String assetPath, String message, Color textColor) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.transparent,
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Lottie.asset(assetPath, width: 200, height: 200, repeat: false),
//               SizedBox(height: 16),
//               Text(
//                 message,
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: textColor),
//               ),
//             ],
//           ),
//         );
//       },
//     );

//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.pop(context);
//       _goToNextQuestion();
//     });
//   }

//   void _goToNextQuestion() {
//     if (currentQuestionIndex < selectedQuestions.length - 1) {
//       setState(() {
//         currentQuestionIndex++;
//         isAnswered = false;
//         _shuffleAnswers();
//       });
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultScreen(
//               score: score, totalQuestions: selectedQuestions.length),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//     var isLargeScreen = screenWidth > 600;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gem Quiz - ${widget.difficulty}'),
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/questions_backg.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 // Progress Bar
//                 LinearProgressIndicator(
//                   value: (currentQuestionIndex + 1) / selectedQuestions.length,
//                   backgroundColor: Colors.grey[300],
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                 ),
//                 SizedBox(height: 20),

//                 // Question Card
//                 Expanded(
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                     elevation: 5,
//                     color: Colors.white.withOpacity(0.9),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Question ${currentQuestionIndex + 1} / ${selectedQuestions.length}',
//                             style: TextStyle(
//                                 fontSize: isLargeScreen ? 22 : 18,
//                                 color: Colors.black54),
//                           ),
//                           SizedBox(height: screenHeight * 0.02),
//                           Text(
//                             selectedQuestions[currentQuestionIndex].question,
//                             style: TextStyle(
//                                 fontSize: isLargeScreen ? 24 : 20,
//                                 fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: screenHeight * 0.02),

//                           // Answer Buttons
//                           Column(
//                             children: shuffledAnswers.map((answer) {
//                               return Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 8.0),
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     minimumSize: Size(
//                                         isLargeScreen
//                                             ? screenWidth * 0.5
//                                             : screenWidth * 0.8,
//                                         50),
//                                     backgroundColor: isAnswered
//                                         ? (answer ==
//                                                 selectedQuestions[
//                                                         currentQuestionIndex]
//                                                     .answers[selectedQuestions[
//                                                         currentQuestionIndex]
//                                                     .correctAnswerIndex]
//                                             ? Colors.green
//                                             : Colors.red)
//                                         : Colors.blue,
//                                   ),
//                                   child: Text(
//                                     answer,
//                                     style: TextStyle(
//                                         fontSize: isLargeScreen ? 20 : 16,
//                                         color: Colors.white),
//                                   ),
//                                   onPressed: () => answerQuestion(answer),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'quiz_questions.dart'; // Ensure all quiz lists are inside this file
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final String difficulty;

  QuizScreen({required this.category, required this.difficulty});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizQuestion> selectedQuestions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  List<String> shuffledAnswers = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _shuffleAnswers();
  }

  void _loadQuestions() {
    Map<String, Map<String, List<QuizQuestion>>> quizData = {
      'Gem Identification and Properties': {
        'easy': gemIdentificationEasy,
        'medium': gemIdentificationMedium,
        'hard': gemIdentificationHard,
      },
      'Gem Cuts, Origins, and History': {
        'easy': gemCutsOriginsEasy,
        'medium': gemCutsOriginsMedium,
        'hard': gemCutsOriginsHard,
      },
      'Synthetic Gems, Treatments, and Care': {
        'easy': syntheticGemsEasy,
        'medium': syntheticGemsMedium,
        'hard': syntheticGemsHard,
      },
      'Final Round: Mixed Category': {
        'easy': mixedRoundEasy,
        'medium': mixedRoundMedium,
        'hard': mixedRoundHard,
      }
    };

    selectedQuestions = List.from(
        quizData[widget.category]?[widget.difficulty] ?? gemIdentificationEasy);
  }

  void _shuffleAnswers() {
    shuffledAnswers =
        List.from(selectedQuestions[currentQuestionIndex].answers);
    shuffledAnswers.shuffle();
  }

  void answerQuestion(String selectedAnswer) {
    if (isAnswered) return;
    setState(() => isAnswered = true);

    bool isCorrect = selectedAnswer ==
        selectedQuestions[currentQuestionIndex].answers[
            selectedQuestions[currentQuestionIndex].correctAnswerIndex];

    _showLottieDialog(
      isCorrect
          ? 'assets/animations/answer_correct_anim.json'
          : 'assets/animations/asnwer_wrong_anim.json',
      isCorrect ? 'Correct!' : 'Wrong!',
      isCorrect ? Colors.green : Colors.red,
    );

    if (isCorrect) score++;
  }

  void _showLottieDialog(String assetPath, String message, Color textColor) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(assetPath, width: 200, height: 200, repeat: false),
              SizedBox(height: 16),
              Text(
                message,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ],
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      _goToNextQuestion();
    });
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < selectedQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        isAnswered = false;
        _shuffleAnswers();
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
              score: score, totalQuestions: selectedQuestions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} - ${widget.difficulty}'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/questions_backg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: (currentQuestionIndex + 1) / selectedQuestions.length,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 5,
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Question ${currentQuestionIndex + 1} / ${selectedQuestions.length}',
                            style: TextStyle(
                                fontSize: isLargeScreen ? 22 : 18,
                                color: Colors.black54),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            selectedQuestions[currentQuestionIndex].question,
                            style: TextStyle(
                                fontSize: isLargeScreen ? 24 : 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Column(
                            children: shuffledAnswers.map((answer) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                        isLargeScreen
                                            ? screenWidth * 0.5
                                            : screenWidth * 0.8,
                                        50),
                                    backgroundColor: isAnswered
                                        ? (answer ==
                                                selectedQuestions[
                                                        currentQuestionIndex]
                                                    .answers[selectedQuestions[
                                                        currentQuestionIndex]
                                                    .correctAnswerIndex]
                                            ? Colors.green
                                            : Colors.red)
                                        : Colors.blue,
                                  ),
                                  child: Text(
                                    answer,
                                    style: TextStyle(
                                        fontSize: isLargeScreen ? 20 : 16,
                                        color: Colors.white),
                                  ),
                                  onPressed: () => answerQuestion(answer),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
