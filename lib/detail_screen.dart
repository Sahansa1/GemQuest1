// // import 'package:flutter/material.dart';
// // import 'gem.dart';

// // class DetailScreen extends StatelessWidget {
// //   final Gem gem;

// //   DetailScreen({required this.gem});

// //   @override
// //   Widget build(BuildContext context) {
// //     var screenWidth = MediaQuery.of(context).size.width;
// //     var isLargeScreen = screenWidth > 600;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(gem.name),
// //         backgroundColor: Color(0xFF67ACF5),
// //       ),
// //       body: Stack(
// //         children: [
// //           // Background image
// //           Positioned.fill(
// //             child: Image.asset(
// //               'assets/images/description_background.jpg',
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           // Semi-transparent overlay

// //           Padding(
// //             padding: const EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0,bottom: 10.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Center(
// //                   child: Image.asset(
// //                     gem.imageUrl,
// //                     height: isLargeScreen ? 350 : 250,
// //                     width: isLargeScreen ? 350 : 250,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //                 SizedBox(height: 10),
// //                 Text(
// //                   gem.name,
// //                   style: TextStyle(
// //                     fontSize: isLargeScreen ? 28 : 24,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.black, // Text color for visibility
// //                   ),
// //                 ),
// //                 SizedBox(height: 8),
// //                 Expanded(
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       border: Border.all(
// //                         color: Colors.black12,

// //                       ),

// //                       color: Colors.white60,
// //                       borderRadius: BorderRadius.circular(10.0), // Uniform radius
// //                     ),

// //                     child: SingleChildScrollView(
// //                       child: Padding(
// //                         padding: const EdgeInsets.only(top: 5.0,right: 15.0,left: 15.0),
// //                         child: Text(
// //                           gem.longdescription,
// //                           style: TextStyle(
// //                             fontSize: isLargeScreen ? 20 : 16,
// //                             color: Colors.black,
// //                             fontWeight: FontWeight.bold
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'dart:ui';

// import 'gem.dart';

// class DetailScreen extends StatefulWidget {
//   final Gem gem;

//   DetailScreen({required this.gem});

//   @override
//   _DetailScreenState createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   bool isExpanded = false;
//   bool isFavorite = false;

//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var isLargeScreen = screenWidth > 600;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.gem.name),
//         backgroundColor: Color(0xFF67ACF5),
//         actions: [
//           IconButton(
//             icon: Icon(
//               isFavorite ? Icons.favorite : Icons.favorite_border,
//               color: Colors.red,
//             ),
//             onPressed: () {
//               setState(() {
//                 isFavorite = !isFavorite;
//               });
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(isFavorite
//                       ? "${widget.gem.name} added to favorites!"
//                       : "${widget.gem.name} removed from favorites."),
//                   duration: Duration(seconds: 1),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Gem Image
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(color: Colors.black26, blurRadius: 8)
//                     ],
//                   ),
//                   child: Image.asset(
//                     widget.gem.imageUrl,
//                     height: isLargeScreen ? 280 : 220,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),

//             // Gem Name
//             Text(
//               widget.gem.name,
//               style: TextStyle(
//                   fontSize: isLargeScreen ? 28 : 24,
//                   fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 8),

//             // Description (Expandable)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         isExpanded
//                             ? widget.gem.longdescription
//                             : _getShortDescription(widget.gem.longdescription),
//                         style: TextStyle(
//                             fontSize: isLargeScreen ? 18 : 16,
//                             color: Colors.black87),
//                       ),
//                       if (widget.gem.longdescription.length > 150)
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               setState(() {
//                                 isExpanded = !isExpanded;
//                               });
//                             },
//                             child: Text(isExpanded ? "Read Less" : "Read More",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.blue)),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(height: 10),

//             // Key Characteristics
//             _buildInfoCard(
//                 "Key Characteristics", widget.gem.keyCharacteristics),

//             // Cultural and Historical Significance
//             _buildInfoCard("Cultural and Historical Significance",
//                 widget.gem.culturalSignificance),

//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Shortens the description if too long
//   String _getShortDescription(String description) {
//     return description.length > 150
//         ? "${description.substring(0, 150)}..."
//         : description;
//   }

//   // Reusable Card for Key Characteristics & Cultural Significance
//   Widget _buildInfoCard(String title, List<String> items) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
//       child: Card(
//         elevation: 3,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title,
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent)),
//               SizedBox(height: 10),
//               Column(
//                 children: items.map((item) => _buildBulletPoint(item)).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Bullet point text widget
//   Widget _buildBulletPoint(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(Icons.circle, size: 8, color: Colors.black54),
//           SizedBox(width: 6),
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 16, color: Colors.black87),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'dart:ui';

import 'gem.dart';

class DetailScreen extends StatefulWidget {
  final Gem gem;

  DetailScreen({required this.gem});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isExpanded = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gem.name),
        backgroundColor: Color(0xFF67ACF5),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavorite
                      ? "${widget.gem.name} added to favorites!"
                      : "${widget.gem.name} removed from favorites."),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tap-to-Zoom Image
            GestureDetector(
              onTap: () => _showImageDialog(context),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 5)
                      ],
                    ),
                    child: Image.asset(
                      widget.gem.imageUrl,
                      height: isLargeScreen ? 180 : 150,
                      width: isLargeScreen ? 180 : 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // Gem Name
            Text(
              widget.gem.name,
              style: TextStyle(
                  fontSize: isLargeScreen ? 28 : 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
// Key Characteristics
            Text(
              widget.gem.description,
              style: TextStyle(
                fontSize: isLargeScreen ? 18 : 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            // Expandable Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isExpanded
                            ? widget.gem.longdescription
                            : _getShortDescription(widget.gem.longdescription),
                        style: TextStyle(
                            fontSize: isLargeScreen ? 18 : 16,
                            color: Colors.black87),
                      ),
                      if (widget.gem.longdescription.length > 150)
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Text(isExpanded ? "Read Less" : "Read More",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Key Characteristics
            _buildInfoCard(
                "Key Characteristics", widget.gem.keyCharacteristics),

            // Cultural and Historical Significance
            _buildInfoCard("Cultural and Historical Significance",
                widget.gem.culturalSignificance),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Shortens the description if too long
  String _getShortDescription(String description) {
    return description.length > 150
        ? "${description.substring(0, 150)}..."
        : description;
  }

  // Reusable Card for Key Characteristics & Cultural Significance
  Widget _buildInfoCard(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent)),
              SizedBox(height: 10),
              Column(
                children: items.map((item) => _buildBulletPoint(item)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bullet point text widget
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 8, color: Colors.black54),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // void _openImageFullScreen(BuildContext context, String imageUrl) {
  //   Navigator.push(
  //     context,
  //     PageRouteBuilder(
  //       opaque: false,
  //       pageBuilder: (context, _, __) => Scaffold(
  //         backgroundColor: Colors.black.withOpacity(0.8), // Dark overlay
  //         body: Stack(
  //           children: [
  //             // Zoomable & Rotatable Image
  //             Center(
  //               child: Container(
  //                 width: double.infinity,
  //                 height: double.infinity,
  //                 child: PhotoView(
  //                   imageProvider: AssetImage(imageUrl),
  //                   backgroundDecoration: BoxDecoration(
  //                     color: Colors.transparent,
  //                   ),
  //                   minScale:
  //                       PhotoViewComputedScale.contained, // Minimum zoom level
  //                   maxScale:
  //                       PhotoViewComputedScale.covered * 2.5, // Max zoom level
  //                   enableRotation: true, // Allows image rotation
  //                   gestureDetectorBehavior: HitTestBehavior
  //                       .translucent, // Ensures touch gestures work
  //                 ),
  //               ),
  //             ),

  //             // Close Button
  //             Positioned(
  //               top: 40,
  //               right: 20,
  //               child: IconButton(
  //                 icon: Icon(Icons.close, color: Colors.white, size: 30),
  //                 onPressed: () => Navigator.pop(context),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //         return FadeTransition(
  //           opacity: animation,
  //           child: child,
  //         );
  //       },
  //     ),
  //   );
  // }

  // Fullscreen image preview dialog
  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: InteractiveViewer(
          child: Image.asset(widget.gem.imageUrl),
        ),
      ),
    );
  }
}
