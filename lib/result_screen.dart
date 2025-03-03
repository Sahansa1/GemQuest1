// import 'package:flutter/material.dart';

// class ResultScreen extends StatelessWidget {
//   final int score;
//   final int totalQuestions;

//   ResultScreen({required this.score, required this.totalQuestions});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Quiz Result')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Your Score: $score/$totalQuestions',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Retake Quiz'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'quiz_category_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultScreen({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    double percentage = (score / totalQuestions) * 100;
    String feedback = _getFeedback(percentage);

    return Scaffold(
      appBar: AppBar(title: Text('Quiz Results')),
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
                SizedBox(height: 20),
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

  String _getFeedback(double percentage) {
    if (percentage >= 80) {
      return 'Excellent! You are a gem expert! 💎';
    } else if (percentage >= 50) {
      return 'Good job! Keep learning! 👍';
    } else {
      return 'Keep practicing! You can do better! 💪';
    }
  }

  IconData _getIcon(double percentage) {
    if (percentage >= 80) {
      return Icons.emoji_events; // Trophy icon
    } else if (percentage >= 50) {
      return Icons.thumb_up; // Thumbs up icon
    } else {
      return Icons.refresh; // Try again icon
    }
  }

  Color _getIconColor(double percentage) {
    if (percentage >= 80) {
      return Colors.green;
    } else if (percentage >= 50) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  void _shareScore(BuildContext context, int score, int totalQuestions) {
    final String shareText =
        "I scored $score out of $totalQuestions on the Gem Quiz! 💎 Try to beat my score!";
    // Add sharing functionality here (e.g., Share plugin for Flutter)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Share feature coming soon!")),
    );
  }
}
