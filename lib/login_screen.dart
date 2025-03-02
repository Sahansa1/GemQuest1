// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'home_screen.dart';
// import 'signup_screen.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   Future<void> login() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Attempt to sign in with Firebase Auth
//         UserCredential userCredential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text,
//         );
//         // Navigate to HomeScreen on successful login
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => HomeScreen()),
//         );
//       } on FirebaseAuthException catch (e) {
//         // Show error message from Firebase
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(e.message ?? 'Login failed')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Enter your email' : null,
//               ),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Enter your password' : null,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: login,
//                 child: const Text('Login'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   // Navigate to the Sign-Up Screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => SignupScreen()),
//                   );
//                 },
//                 child: const Text("Don't have an account? Sign Up"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import 'background_wrapper.dart'; // Import background wrapper

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Login failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Keep background transparent
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo at the top
                  Image.asset(
                    'assets/images/logo1.png', // Logo path
                    height: 150,
                  ),
                  const SizedBox(height: 20),

                  // Login Form
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Email Input
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Enter your email'
                                      : null,
                            ),
                            const SizedBox(height: 15),

                            // Password Input
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              obscureText: true,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Enter your password'
                                      : null,
                            ),
                            const SizedBox(height: 20),

                            // Login Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: login,
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),

                            const SizedBox(height: 15),

                            // Sign Up Link
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignupScreen()),
                                );
                              },
                              child: const Text(
                                "Don't have an account? Sign Up",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
