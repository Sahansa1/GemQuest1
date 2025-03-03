// // // import 'package:flutter/material.dart';

// // // class ResultScreen extends StatelessWidget {
// // //   final int score;
// // //   final int totalQuestions;

// // //   ResultScreen({required this.score, required this.totalQuestions});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Quiz Result')),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Text(
// // //               'Your Score: $score/$totalQuestions',
// // //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //             ),
// // //             SizedBox(height: 20),
// // //             ElevatedButton(
// // //               onPressed: () {
// // //                 Navigator.pop(context);
// // //               },
// // //               child: Text('Retake Quiz'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'home_screen.dart';
// // import 'quiz_category_screen.dart';

// // class ResultScreen extends StatelessWidget {
// //   final int score;
// //   final int totalQuestions;

// //   ResultScreen({required this.score, required this.totalQuestions});

// //   @override
// //   Widget build(BuildContext context) {
// //     double percentage = (score / totalQuestions) * 100;
// //     String feedback = _getFeedback(percentage);

// //     return Scaffold(
// //       appBar: AppBar(title: Text('Quiz Results')),
// //       body: Center(
// //         child: Card(
// //           margin: EdgeInsets.all(16),
// //           shape:
// //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //           elevation: 5,
// //           child: Padding(
// //             padding: const EdgeInsets.all(20.0),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Icon(
// //                   _getIcon(percentage),
// //                   size: 80,
// //                   color: _getIconColor(percentage),
// //                 ),
// //                 SizedBox(height: 10),
// //                 Text(
// //                   'Your Score',
// //                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text(
// //                   '$score / $totalQuestions',
// //                   style: TextStyle(
// //                       fontSize: 30,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.blueAccent),
// //                 ),
// //                 SizedBox(height: 10),
// //                 Text(
// //                   feedback,
// //                   style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.w500,
// //                       color: Colors.black87),
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 SizedBox(height: 20),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         Navigator.pushReplacement(
// //                           context,
// //                           MaterialPageRoute(
// //                               builder: (context) => QuizCategoryScreen()),
// //                         );
// //                       },
// //                       child: Text('Retake Quiz'),
// //                     ),
// //                     SizedBox(width: 10),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         Navigator.pushReplacement(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => HomeScreen()),
// //                         );
// //                       },
// //                       child: Text('Home'),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 20),
// //                 ElevatedButton.icon(
// //                   onPressed: () => _shareScore(context, score, totalQuestions),
// //                   icon: Icon(Icons.share),
// //                   label: Text('Share Score'),
// //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   String _getFeedback(double percentage) {
// //     if (percentage >= 80) {
// //       return 'Excellent! You are a gem expert! 💎';
// //     } else if (percentage >= 50) {
// //       return 'Good job! Keep learning! 👍';
// //     } else {
// //       return 'Keep practicing! You can do better! 💪';
// //     }
// //   }

// //   IconData _getIcon(double percentage) {
// //     if (percentage >= 80) {
// //       return Icons.emoji_events; // Trophy icon
// //     } else if (percentage >= 50) {
// //       return Icons.thumb_up; // Thumbs up icon
// //     } else {
// //       return Icons.refresh; // Try again icon
// //     }
// //   }

// //   Color _getIconColor(double percentage) {
// //     if (percentage >= 80) {
// //       return Colors.green;
// //     } else if (percentage >= 50) {
// //       return Colors.orange;
// //     } else {
// //       return Colors.red;
// //     }
// //   }

// //   void _shareScore(BuildContext context, int score, int totalQuestions) {
// //     final String shareText =
// //         "I scored $score out of $totalQuestions on the Gem Quiz! 💎 Try to beat my score!";
// //     // Add sharing functionality here (e.g., Share plugin for Flutter)
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text("Share feature coming soon!")),
// //     );
// //   }
// // }

// class ResultScreen extends StatelessWidget {
//   final int score;
//   final int totalQuestions;

//   ResultScreen({required this.score, required this.totalQuestions});

//   @override
//   Widget build(BuildContext context) {
//     double percentage = (score / totalQuestions) * 100;
//     String feedback = _getFeedback(percentage);

//     // Save score to Firestore
//     _saveScore();

//     return Scaffold(
//       appBar: AppBar(title: Text('Quiz Results')),
//       body: Center(
//         child: Card(
//           margin: EdgeInsets.all(16),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           elevation: 5,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   _getIcon(percentage),
//                   size: 80,
//                   color: _getIconColor(percentage),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Your Score',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   '$score / $totalQuestions',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   feedback,
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black87),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 20),

//                 // Buttons for Retake Quiz and Home
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => QuizCategoryScreen()),
//                         );
//                       },
//                       child: Text('Retake Quiz'),
//                     ),
//                     SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => HomeScreen()),
//                         );
//                       },
//                       child: Text('Home'),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 15),

//                 // View Score History Button
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ScoreHistoryScreen()),
//                     );
//                   },
//                   icon: Icon(Icons.history),
//                   label: Text('View My Scores'),
//                   style:
//                       ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//                 ),
//                 SizedBox(height: 15),

//                 // Share Score Button
//                 ElevatedButton.icon(
//                   onPressed: () => _shareScore(context, score, totalQuestions),
//                   icon: Icon(Icons.share),
//                   label: Text('Share Score'),
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _saveScore() async {
//     try {
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         // Use `.add()` to create a new record instead of overwriting
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .collection('scores')
//             .add({
//           'score': score,
//           'totalQuestions': totalQuestions,
//           'percentage': (score / totalQuestions) * 100,
//           'timestamp': FieldValue.serverTimestamp(), // Store timestamp
//         });
//         print("✅ Score saved successfully!");
//       } else {
//         print("⚠ User is not logged in. Score not saved.");
//       }
//     } catch (e) {
//       print("❌ Error saving score: $e");
//     }
//   }

//   /// Get feedback message based on percentage
//   String _getFeedback(double percentage) {
//     if (percentage >= 80) {
//       return 'Excellent! You are a gem expert! 💎';
//     } else if (percentage >= 50) {
//       return 'Good job! Keep learning! 👍';
//     } else {
//       return 'Keep practicing! You can do better! 💪';
//     }
//   }

//   /// Get icon based on score percentage
//   IconData _getIcon(double percentage) {
//     if (percentage >= 80) {
//       return Icons.emoji_events; // Trophy icon
//     } else if (percentage >= 50) {
//       return Icons.thumb_up; // Thumbs up icon
//     } else {
//       return Icons.refresh; // Try again icon
//     }
//   }

//   /// Get icon color based on score
//   Color _getIconColor(double percentage) {
//     if (percentage >= 80) {
//       return Colors.green;
//     } else if (percentage >= 50) {
//       return Colors.orange;
//     } else {
//       return Colors.red;
//     }
//   }

//   /// Share the score (You can use the share_plus package for real sharing)
//   void _shareScore(BuildContext context, int score, int totalQuestions) {
//     final String shareText =
//         "I scored $score out of $totalQuestions on the Gem Quiz! 💎 Try to beat my score!";

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Share feature coming soon!")),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'quiz_category_screen.dart';
import 'score_history_screen.dart'; // New screen for viewing past scores

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String category; // Add category

  ResultScreen({
    required this.score,
    required this.totalQuestions,
    required this.category, // Include category
  });

  @override
  Widget build(BuildContext context) {
    double percentage = (score / totalQuestions) * 100;
    String feedback = _getFeedback(percentage);

    // Save score to Firestore
    _saveScore();

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
        backgroundColor: const Color.fromARGB(255, 2, 30, 45),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getIcon(percentage),
                  size: 80,
                  color: _getIconColor(percentage),
                ),
                SizedBox(height: 10),
                Text(
                  'Your Score',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '$score / $totalQuestions',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                SizedBox(height: 10),
                Text(
                  feedback,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Buttons for Retake Quiz and Home
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizCategoryScreen()),
                        );
                      },
                      child: Text('Retake Quiz'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Text('Home'),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // View Score History Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScoreHistoryScreen()),
                    );
                  },
                  icon: Icon(Icons.history),
                  label: Text('View My Scores'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                ),
                SizedBox(height: 15),

                // Share Score Button
                ElevatedButton.icon(
                  onPressed: () => _shareScore(context, score, totalQuestions),
                  icon: Icon(Icons.share),
                  label: Text('Share Score'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// **✅ Save score with category in Firestore**
  Future<void> _saveScore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('scores')
            .add({
          'score': score,
          'totalQuestions': totalQuestions,
          'percentage': (score / totalQuestions) * 100,
          'timestamp': FieldValue.serverTimestamp(),
          'category': category, // ✅ Save the category
        });
        print("✅ Score saved successfully!");
      } else {
        print("⚠ User is not logged in. Score not saved.");
      }
    } catch (e) {
      print("❌ Error saving score: $e");
    }
  }

  /// Get feedback message based on percentage
  String _getFeedback(double percentage) {
    if (percentage >= 80) {
      return 'Excellent! You are a gem expert! 💎';
    } else if (percentage >= 50) {
      return 'Good job! Keep learning! 👍';
    } else {
      return 'Keep practicing! You can do better! 💪';
    }
  }

  /// Get icon based on score percentage
  IconData _getIcon(double percentage) {
    if (percentage >= 80) {
      return Icons.emoji_events; // Trophy icon
    } else if (percentage >= 50) {
      return Icons.thumb_up; // Thumbs up icon
    } else {
      return Icons.refresh; // Try again icon
    }
  }

  /// Get icon color based on score
  Color _getIconColor(double percentage) {
    if (percentage >= 80) {
      return Colors.green;
    } else if (percentage >= 50) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  /// Share the score (You can use the share_plus package for real sharing)
  void _shareScore(BuildContext context, int score, int totalQuestions) {
    final String shareText =
        "I scored $score out of $totalQuestions on the Gem Quiz! 💎 Try to beat my score!";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Share feature coming soon!")),
    );
  }
}
