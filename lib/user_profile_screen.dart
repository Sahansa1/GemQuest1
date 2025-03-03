import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 50, color: Colors.blueGrey),
              ),
              SizedBox(height: 20),

              // Display Name
              Text(
                user?.displayName ?? "No Name",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),

              // Email
              Text(
                user?.email ?? "No Email",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 30),

              // Edit Profile Button (Placeholder for future updates)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(200, 50),
                ),
                icon: Icon(Icons.edit),
                label: Text("Edit Profile"),
                onPressed: () {
                  // Placeholder for future edit functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Edit Profile feature coming soon!")),
                  );
                },
              ),
              SizedBox(height: 15),

              // Logout Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: Size(200, 50),
                ),
                icon: Icon(Icons.logout),
                label: Text("Logout"),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
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
