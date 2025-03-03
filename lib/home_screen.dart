// // import 'package:flutter/material.dart';
// // import 'encyclopedia_screen.dart';
// // import 'quiz_screen.dart';
// // import 'quiz_category_screen.dart';
// // import 'gemstone_map_screen.dart';

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     var screenWidth = MediaQuery.of(context).size.width;
// //     var isLargeScreen = screenWidth > 600;

// //     return Scaffold(
// //       body: Container(
// //         decoration: BoxDecoration(
// //           image: DecorationImage(
// //             image: AssetImage('assets/images/background1.png'),
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //         child: Center(
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Text(
// //                   'Gem Quest',
// //                   style: TextStyle(
// //                     fontSize: isLargeScreen ? 35 : 30,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white, // Ensure the title is visible
// //                   ),
// //                   textAlign: TextAlign.center, // Centering the title
// //                 ),
// //                 SizedBox(height: 50),
// //                 ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     minimumSize: Size(isLargeScreen ? 250 : 150, 50),
// //                   ),
// //                   child: Text('Encyclopedia',
// //                       style: TextStyle(fontSize: isLargeScreen ? 20 : 16)),
// //                   onPressed: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => EncyclopediaScreen(),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //                 SizedBox(height: 20),
// //                 ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     minimumSize: Size(isLargeScreen ? 250 : 150, 50),
// //                   ),
// //                   child: Text('Take the Quiz',
// //                       style: TextStyle(fontSize: isLargeScreen ? 20 : 16)),
// //                   onPressed: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                           builder: (context) => QuizCategoryScreen()),
// //                     );
// //                   },
// //                 ),
// //                 SizedBox(height: 20),
// //                 // New Button: Go to Location Map
// //                 ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     minimumSize: Size(isLargeScreen ? 250 : 150, 50),
// //                   ),
// //                   child: Text('View Gemstone Locations',
// //                       style: TextStyle(fontSize: isLargeScreen ? 20 : 16)),
// //                   onPressed: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) =>
// //                             GemstoneMapScreen(), // Navigate to the Map Screen
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'encyclopedia_screen.dart';
// import 'quiz_category_screen.dart';
// import 'gemstone_map_screen.dart';
// import 'score_history_screen.dart';
// import 'login_screen.dart'; // Ensure you have this file for logout
// import 'user_profile_screen.dart'; // Create a user profile screen if needed

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var isLargeScreen = screenWidth > 600;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gem Quest'),
//         backgroundColor: const Color.fromARGB(255, 3, 45, 67), // Customize as needed
//       ),
//       drawer: NavigationDrawer(), // ✅ Add Drawer
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/background1.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Gem Quest',
//                   style: TextStyle(
//                     fontSize: isLargeScreen ? 35 : 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 50),
//                 _buildButton(context, 'Encyclopedia', EncyclopediaScreen()),
//                 SizedBox(height: 20),
//                 _buildButton(context, 'Take the Quiz', QuizCategoryScreen()),
//                 SizedBox(height: 20),
//                 _buildButton(
//                     context, 'View Gemstone Locations', GemstoneMapScreen()),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Custom button widget
//   Widget _buildButton(BuildContext context, String text, Widget screen) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(minimumSize: Size(250, 50)),
//       child: Text(text, style: TextStyle(fontSize: 18)),
//       onPressed: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => screen));
//       },
//     );
//   }
// }

//   /// **Navigation Drawer**
//   Widget _buildDrawer(BuildContext context, User? user) {
//     return Drawer(
//       child: Column(
//         children: [
//           _buildProfileHeader(user),
//           Expanded(
//             child: ListView(
//               children: [
//                 _buildDrawerItem(Icons.account_circle, "Profile", () {
//                   //Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
//                 }),
//                 _buildDrawerItem(Icons.history, "Quiz History", () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => ScoreHistoryScreen()));
//                 }),
//                 Divider(), // Adds separation line
//                 _buildDrawerItem(Icons.exit_to_app, "Logout", () async {
//                   await FirebaseAuth.instance.signOut();
//                   Navigator.pushReplacementNamed(context, "/login");
//                 }),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// **User Profile Header in Drawer**
//   Widget _buildProfileHeader(User? user) {
//     return Container(
//       height: 250, // Bigger profile section
//       width: double.infinity,
//       color: Colors.blueGrey, // Background color
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 50, // Bigger avatar
//             backgroundColor: Colors.white,
//             backgroundImage: user?.photoURL != null ? NetworkImage(user!.photoURL!) : null,
//             child: user?.photoURL == null ? Icon(Icons.person, size: 50, color: Colors.blueGrey) : null,
//           ),
//           SizedBox(height: 10),
//           Text(
//             user?.displayName ?? "Guest",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           Text(
//             user?.email ?? "Not logged in",
//             style: TextStyle(fontSize: 16, color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }

//   /// **Reusable Drawer Item**
//   Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.blueGrey),
//       title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//       onTap: onTap,
//     );
//   }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'encyclopedia_screen.dart';
import 'quiz_category_screen.dart';
import 'gemstone_map_screen.dart';
import 'score_history_screen.dart';
import 'user_profile_screen.dart'; // Import user profile screen
import 'background_wrapper.dart'; // Import background wrapper

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 600;
    final User? user = FirebaseAuth.instance.currentUser;

    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Keeps background wrapper visible
        appBar: AppBar(
          title: Text('Gem Quest'),
          backgroundColor: const Color.fromARGB(255, 2, 30, 45),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        drawer: _buildDrawer(context, user), // Navigation Drawer
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'Gem Quest',
                //   style: TextStyle(
                //     fontSize: isLargeScreen ? 35 : 30,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white, // Ensures visibility
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 50),
                _buildHomeButton(context, 'Encyclopedia', EncyclopediaScreen()),
                SizedBox(height: 20),
                _buildHomeButton(
                    context, 'Take the Quiz', QuizCategoryScreen()),
                SizedBox(height: 20),
                _buildHomeButton(
                    context, 'View Gemstone Locations', GemstoneMapScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// **Navigation Drawer**
  Widget _buildDrawer(BuildContext context, User? user) {
    return Drawer(
      child: Column(
        children: [
          _buildProfileHeader(user),
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(Icons.account_circle, "Profile", () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
                }),
                _buildDrawerItem(Icons.history, "Quiz History", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScoreHistoryScreen()));
                }),
                Divider(), // Adds separation line
                _buildDrawerItem(Icons.exit_to_app, "Logout", () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, "/login");
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// **User Profile Header in Drawer**
  Widget _buildProfileHeader(User? user) {
    return Container(
      height: 250, // Bigger profile section
      width: double.infinity,
      color: Colors.blueGrey, // Background color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50, // Bigger avatar
            backgroundColor: Colors.white,
            backgroundImage:
                user?.photoURL != null ? NetworkImage(user!.photoURL!) : null,
            child: user?.photoURL == null
                ? Icon(Icons.person, size: 50, color: Colors.blueGrey)
                : null,
          ),
          SizedBox(height: 10),
          Text(
            user?.displayName ?? "Guest",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            user?.email ?? "Not logged in",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  /// **Reusable Drawer Item**
  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      title: Text(title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }

  /// **Reusable Home Screen Button**
  Widget _buildHomeButton(BuildContext context, String title, Widget screen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(250, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor:
            const Color.fromARGB(255, 236, 236, 236), // Consistent theme
      ),
      child: Text(title,
          style: TextStyle(
            fontSize: 20,
            color: const Color.fromARGB(255, 2, 30, 45),
          )),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => screen)),
    );
  }
}
