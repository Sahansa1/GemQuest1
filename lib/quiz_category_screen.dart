// import 'package:flutter/material.dart';
// import 'quiz_difficulty_screen.dart';

// class QuizCategoryScreen extends StatelessWidget {
//   final List<String> categories = [
//     'Gem Identification and Properties',
//     'Gem Cuts, Origins, and History',
//     'Synthetic Gems, Treatments, and Care',
//     'Final Round: Mixed Category'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Select Category')),
//       body: ListView.builder(
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(categories[index]),
//             trailing: Icon(Icons.arrow_forward),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       QuizDifficultyScreen(category: categories[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'quiz_difficulty_screen.dart';
import 'background_wrapper.dart';

class QuizCategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'Gem Identification and Properties',
    'Gem Cuts, Origins, and History',
    'Synthetic Gems, Treatments, and Care',
    'Final Round: Mixed Category'
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(title: Text('Select Category')),
      body: BackgroundWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isLargeScreen ? 50.0 : 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: categories.map((category) {
                      return _buildCategoryButton(
                          context, category, isLargeScreen);
                    }).toList(),
                  ),
                ),
              ),
            ),
            _buildBottomNote(), // 👇 Added a small bottom note
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String category, bool isLargeScreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(isLargeScreen ? 280 : 200, 60),
              backgroundColor: Colors.white.withOpacity(0.9),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 10,
            ),
            child: Text(
              category,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isLargeScreen ? 20 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      QuizDifficultyScreen(category: category),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNote() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(seconds: 10), // Smooth fade-in effect
        child: Text(
          'More categories will be added soon!',
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
