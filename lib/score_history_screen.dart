import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScoreHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Your Quiz History")),
        body: Center(child: Text("You need to log in to view your scores.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Your Quiz History")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid) // Access the logged-in user's document
            .collection('scores') // Fetch scores from the scores subcollection
            .orderBy('timestamp', descending: true) // Latest first
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error loading scores"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No quiz scores yet. Try a quiz!"));
          }

          final scores = snapshot.data!.docs;

          return ListView.builder(
            itemCount: scores.length,
            itemBuilder: (context, index) {
              var data = scores[index].data() as Map<String, dynamic>;

              // Ensure timestamp exists and is valid
              String formattedDate = "Unknown date";
              if (data.containsKey('timestamp') && data['timestamp'] != null) {
                Timestamp timestamp = data['timestamp'];
                formattedDate = DateTime.fromMillisecondsSinceEpoch(
                        timestamp.seconds * 1000)
                    .toString();
              }

              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  leading: Icon(Icons.school, color: Colors.blueAccent),
                  title: Text(
                    data.containsKey('category')
                        ? data['category']
                        : "Unknown Category",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Score: ${data['score']} / ${data['totalQuestions']}"),
                      Text("Percentage: ${data['percentage']}%"),
                      Text("Date: $formattedDate"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
