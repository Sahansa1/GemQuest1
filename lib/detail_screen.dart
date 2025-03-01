import 'package:flutter/material.dart';
import 'gem.dart';

class DetailScreen extends StatelessWidget {
  final Gem gem;

  DetailScreen({required this.gem});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(gem.name),
        backgroundColor: Color(0xFF67ACF5),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/description_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay

          Padding(
            padding: const EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0,bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    gem.imageUrl,
                    height: isLargeScreen ? 350 : 250,
                    width: isLargeScreen ? 350 : 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  gem.name,
                  style: TextStyle(
                    fontSize: isLargeScreen ? 28 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Text color for visibility
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,

                      ),

                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(10.0), // Uniform radius
                    ),

                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0,right: 15.0,left: 15.0),
                        child: Text(
                          gem.longdescription,
                          style: TextStyle(
                            fontSize: isLargeScreen ? 20 : 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
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
