// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_map/flutter_map.dart';
// // // import 'package:latlong2/latlong.dart';

// // // class GemstoneMapScreen extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Geographic Gemstone Map')),
// // //       body: FlutterMap(
// // //         options: MapOptions(
// // //           center: LatLng(20.0, 0.0), // Center of the world map
// // //           zoom: 2.0,
// // //         ),
// // //         children: [
// // //           TileLayer(
// // //             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
// // //           ),
// // //           MarkerLayer(
// // //             markers: [
// // //               // Example: Marker for Sri Lanka (Sapphires)
// // //               Marker(
// // //                 width: 80.0,
// // //                 height: 80.0,
// // //                 point: LatLng(7.8731, 80.7718),
// // //                 builder: (ctx) => GestureDetector(
// // //                   onTap: () {
// // //                     showGemstoneInfo(context, 'Sri Lanka', 'Blue Sapphire',
// // //                         'Sri Lanka is famous for its high-quality Blue Sapphires...');
// // //                   },
// // //                   child: Icon(Icons.location_on, color: Colors.blue, size: 30),
// // //                 ),
// // //               ),
// // //               // Example: Marker for Colombia (Emeralds)
// // //               Marker(
// // //                 width: 80.0,
// // //                 height: 80.0,
// // //                 point: LatLng(4.5709, -74.2973),
// // //                 builder: (ctx) => GestureDetector(
// // //                   onTap: () {
// // //                     showGemstoneInfo(context, 'Colombia', 'Emerald',
// // //                         'Colombia produces 70% of the world’s emeralds...');
// // //                   },
// // //                   child: Icon(Icons.location_on, color: Colors.green, size: 30),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   void showGemstoneInfo(
// // //       BuildContext context, String country, String gem, String description) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (context) => AlertDialog(
// // //         title: Text('$gem - $country'),
// // //         content: Text(description),
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () => Navigator.pop(context),
// // //             child: Text('Close'),
// // //           ),
// // //           TextButton(
// // //             onPressed: () {
// // //               // Navigate to AR page (if implemented)
// // //               Navigator.pop(context);
// // //             },
// // //             child: Text('View in AR'),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';

// // class GemstoneMapScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Geographic Gemstone Map')),
// //       body: FlutterMap(
// //         options: MapOptions(
// //           initialCenter: LatLng(20.0, 0.0), // Center of the world map
// //           initialZoom: 2.0,
// //         ),
// //         children: [
// //           TileLayer(
// //             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
// //             subdomains: ['a', 'b', 'c'],
// //           ),
// //           MarkerLayer(
// //             markers: [
// //               // Sri Lanka - Blue Sapphire
// //               Marker(
// //                 point: LatLng(7.8731, 80.7718),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Sri Lanka', 'Blue Sapphire',
// //                         'Sri Lanka is famous for its high-quality Blue Sapphires.');
// //                   },
// //                   child: Icon(Icons.location_on, color: Colors.blue, size: 30),
// //                 ),
// //               ),

// //               // Colombia - Emerald
// //               Marker(
// //                 point: LatLng(4.5709, -74.2973),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Colombia', 'Emerald',
// //                         'Colombia produces 70% of the world’s emeralds.');
// //                   },
// //                   child: Icon(Icons.location_on, color: Colors.green, size: 30),
// //                 ),
// //               ),

// //               // Myanmar - Ruby
// //               Marker(
// //                 point: LatLng(21.9162, 95.9560),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Myanmar', 'Ruby',
// //                         'Myanmar’s Mogok Valley is famous for the "Pigeon’s Blood" Ruby.');
// //                   },
// //                   child: Icon(Icons.location_on, color: Colors.red, size: 30),
// //                 ),
// //               ),

// //               // Brazil - Topaz
// //               Marker(
// //                 point: LatLng(-14.2350, -51.9253),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Brazil', 'Topaz',
// //                         'Brazil is the leading producer of Imperial Topaz.');
// //                   },
// //                   child:
// //                       Icon(Icons.location_on, color: Colors.orange, size: 30),
// //                 ),
// //               ),

// //               // Madagascar - Pink Sapphire
// //               Marker(
// //                 point: LatLng(-18.8792, 47.5079),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Madagascar', 'Pink Sapphire',
// //                         'Madagascar is a top producer of Pink Sapphires.');
// //                   },
// //                   child: Icon(Icons.location_on, color: Colors.pink, size: 30),
// //                 ),
// //               ),

// //               // India - Star Sapphire
// //               Marker(
// //                 point: LatLng(20.5937, 78.9629),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'India', 'Star Sapphire',
// //                         'India’s Kashmir region is famous for deep-blue Star Sapphires.');
// //                   },
// //                   child: Icon(Icons.location_on,
// //                       color: Colors.deepPurple, size: 30),
// //                 ),
// //               ),

// //               // Russia - Alexandrite
// //               Marker(
// //                 point: LatLng(61.5240, 105.3188),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Russia', 'Alexandrite',
// //                         'Russia’s Ural Mountains produced the first color-changing Alexandrite.');
// //                   },
// //                   child: Icon(Icons.location_on, color: Colors.teal, size: 30),
// //                 ),
// //               ),

// //               // Australia - Opal
// //               Marker(
// //                 point: LatLng(-25.2744, 133.7751),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Australia', 'Opal',
// //                         'Australia is the largest producer of precious opals.');
// //                   },
// //                   child: Icon(Icons.location_on, color: Colors.cyan, size: 30),
// //                 ),
// //               ),

// //               // Tanzania - Tanzanite
// //               Marker(
// //                 point: LatLng(-6.3690, 34.8888),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Tanzania', 'Tanzanite',
// //                         'Tanzanite is found only in Tanzania near Mount Kilimanjaro.');
// //                   },
// //                   child:
// //                       Icon(Icons.location_on, color: Colors.indigo, size: 30),
// //                 ),
// //               ),

// //               // Thailand - Garnet
// //               Marker(
// //                 point: LatLng(15.8700, 100.9925),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Thailand', 'Garnet',
// //                         'Thailand is known for bright orange Spessartite Garnets.');
// //                   },
// //                   child: Icon(Icons.location_on, color: Colors.brown, size: 30),
// //                 ),
// //               ),

// //               // Example: Marker for Sri Lanka (Sapphires)
// //               Marker(
// //                 point: LatLng(7.8731, 80.7718),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Sri Lanka', 'Blue Sapphire',
// //                         'Sri Lanka is famous for its high-quality Blue Sapphires...');
// //                   },
// //                   child: Icon(Icons.location_on, color: Colors.blue, size: 30),
// //                 ),
// //               ),
// //               // Example: Marker for Colombia (Emeralds)
// //               Marker(
// //                 point: LatLng(4.5709, -74.2973),
// //                 width: 80.0,
// //                 height: 80.0,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     showGemstoneInfo(context, 'Colombia', 'Emerald',
// //                         'Colombia produces 70% of the world’s emeralds...');
// //                   },
// //                   child: Icon(Icons.location_on, color: Colors.green, size: 30),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void showGemstoneInfo(
// //       BuildContext context, String country, String gem, String description) {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: Text('$gem - $country'),
// //         content: Text(description),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: Text('Close'),
// //           ),
// //           TextButton(
// //             onPressed: () {
// //               // Navigate to AR page (if implemented)
// //               Navigator.pop(context);
// //             },
// //             child: Text('View in AR'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class GemstoneMapScreen extends StatefulWidget {
//   @override
//   _GemstoneMapScreenState createState() => _GemstoneMapScreenState();
// }

// class _GemstoneMapScreenState extends State<GemstoneMapScreen> {
//   String selectedGemType = 'All'; // Default selection

//   // List of gemstones with locations and types
//   final List<Map<String, dynamic>> gemstoneLocations = [
//     {
//       'country': 'Sri Lanka',
//       'gem': 'Blue Sapphire',
//       'latlng': LatLng(7.8731, 80.7718),
//       'type': 'Sapphire'
//     },
//     {
//       'country': 'Colombia',
//       'gem': 'Emerald',
//       'latlng': LatLng(4.5709, -74.2973),
//       'type': 'Emerald'
//     },
//     {
//       'country': 'Myanmar',
//       'gem': 'Ruby',
//       'latlng': LatLng(21.9162, 95.9560),
//       'type': 'Ruby'
//     },
//     {
//       'country': 'Brazil',
//       'gem': 'Topaz',
//       'latlng': LatLng(-14.2350, -51.9253),
//       'type': 'Topaz'
//     },
//     {
//       'country': 'Madagascar',
//       'gem': 'Pink Sapphire',
//       'latlng': LatLng(-18.8792, 47.5079),
//       'type': 'Sapphire'
//     },
//     {
//       'country': 'India',
//       'gem': 'Star Sapphire',
//       'latlng': LatLng(20.5937, 78.9629),
//       'type': 'Sapphire'
//     },
//     {
//       'country': 'Russia',
//       'gem': 'Alexandrite',
//       'latlng': LatLng(61.5240, 105.3188),
//       'type': 'Alexandrite'
//     },
//     {
//       'country': 'Australia',
//       'gem': 'Opal',
//       'latlng': LatLng(-25.2744, 133.7751),
//       'type': 'Opal'
//     },
//     {
//       'country': 'Tanzania',
//       'gem': 'Tanzanite',
//       'latlng': LatLng(-6.3690, 34.8888),
//       'type': 'Tanzanite'
//     },
//     {
//       'country': 'Thailand',
//       'gem': 'Garnet',
//       'latlng': LatLng(15.8700, 100.9925),
//       'type': 'Garnet'
//     },
//   ];

//   // Filtered markers based on selection
//   List<Map<String, dynamic>> getFilteredMarkers() {
//     if (selectedGemType == 'All') {
//       return gemstoneLocations;
//     } else {
//       return gemstoneLocations
//           .where((gem) => gem['type'] == selectedGemType)
//           .toList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Geographic Gemstone Map')),
//       body: Column(
//         children: [
//           // Dropdown for filtering gemstone types
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: DropdownButton<String>(
//               value: selectedGemType,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedGemType = newValue!;
//                 });
//               },
//               items: <String>[
//                 'All',
//                 'Sapphire',
//                 'Ruby',
//                 'Emerald',
//                 'Topaz',
//                 'Alexandrite',
//                 'Opal',
//                 'Tanzanite',
//                 'Garnet'
//               ].map<DropdownMenuItem<String>>((String gemType) {
//                 return DropdownMenuItem<String>(
//                   value: gemType,
//                   child: Text(gemType),
//                 );
//               }).toList(),
//             ),
//           ),

//           // Expanded Map View
//           Expanded(
//             child: FlutterMap(
//               options: MapOptions(
//                 initialCenter: LatLng(20.0, 0.0),
//                 initialZoom: 2.0,
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate:
//                       'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                 ),
//                 MarkerLayer(
//                   markers: getFilteredMarkers().map((gem) {
//                     return Marker(
//                       point: gem['latlng'],
//                       width: 80.0,
//                       height: 80.0,
//                       child: GestureDetector(
//                         onTap: () {
//                           showGemstoneInfo(
//                             context,
//                             gem['country'],
//                             gem['gem'],
//                             '${gem['country']} is famous for its ${gem['gem']}.',
//                           );
//                         },
//                         child: Icon(Icons.location_on,
//                             color: getMarkerColor(gem['type']), size: 30),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to display gemstone details in a popup
//   void showGemstoneInfo(
//       BuildContext context, String country, String gem, String description) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('$gem - $country'),
//         content: Text(description),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }

//   // Assign colors to different gem types
//   Color getMarkerColor(String type) {
//     switch (type) {
//       case 'Sapphire':
//         return Colors.blue;
//       case 'Ruby':
//         return Colors.red;
//       case 'Emerald':
//         return Colors.green;
//       case 'Topaz':
//         return Colors.orange;
//       case 'Alexandrite':
//         return Colors.teal;
//       case 'Opal':
//         return Colors.cyan;
//       case 'Tanzanite':
//         return Colors.indigo;
//       case 'Garnet':
//         return Colors.brown;
//       default:
//         return Colors.grey;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GemstoneMapScreen extends StatefulWidget {
  const GemstoneMapScreen({Key? key}) : super(key: key);

  @override
  _GemstoneMapScreenState createState() => _GemstoneMapScreenState();
}

class _GemstoneMapScreenState extends State<GemstoneMapScreen> {
  String selectedGemType = 'All';

  final List<Map<String, dynamic>> gemstoneLocations = [
    {
      'country': 'Sri Lanka',
      'gem': 'Blue Sapphire',
      'latlng': const LatLng(7.8731, 80.7718),
      'type': 'Sapphire'
    },
    {
      'country': 'Colombia',
      'gem': 'Emerald',
      'latlng': const LatLng(4.5709, -74.2973),
      'type': 'Emerald'
    },
    {
      'country': 'Myanmar',
      'gem': 'Ruby',
      'latlng': const LatLng(21.9162, 95.9560),
      'type': 'Ruby'
    },
    {
      'country': 'Brazil',
      'gem': 'Topaz',
      'latlng': const LatLng(-14.2350, -51.9253),
      'type': 'Topaz'
    },
    {
      'country': 'Madagascar',
      'gem': 'Pink Sapphire',
      'latlng': const LatLng(-18.8792, 47.5079),
      'type': 'Sapphire'
    },
    {
      'country': 'India',
      'gem': 'Star Sapphire',
      'latlng': const LatLng(20.5937, 78.9629),
      'type': 'Sapphire'
    },
    {
      'country': 'Russia',
      'gem': 'Alexandrite',
      'latlng': const LatLng(61.5240, 105.3188),
      'type': 'Alexandrite'
    },
    {
      'country': 'Australia',
      'gem': 'Opal',
      'latlng': const LatLng(-25.2744, 133.7751),
      'type': 'Opal'
    },
    {
      'country': 'Tanzania',
      'gem': 'Tanzanite',
      'latlng': const LatLng(-6.3690, 34.8888),
      'type': 'Tanzanite'
    },
    {
      'country': 'Thailand',
      'gem': 'Garnet',
      'latlng': const LatLng(15.8700, 100.9925),
      'type': 'Garnet'
    },
  ];

  List<Map<String, dynamic>> getFilteredMarkers() {
    if (selectedGemType == 'All') {
      return gemstoneLocations;
    } else {
      return gemstoneLocations
          .where((gem) => gem['type'] == selectedGemType)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemstone Locations'),
        backgroundColor: const Color.fromARGB(255, 2, 30, 45),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 0, 0, 0)), // Back icon
          onPressed: () {
            Navigator.pop(context); // Go back to HomeScreen
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: const LatLng(0, 0),
                initialZoom: 2.5,
                minZoom: 2.5,
                maxZoom: 5.0,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.pinchZoom |
                      InteractiveFlag.drag, // Allow zooming & scrolling
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: getFilteredMarkers().map((gem) {
                    return Marker(
                      point: gem['latlng'],
                      width: 50.0,
                      height: 50.0,
                      child: GestureDetector(
                        onTap: () {
                          showGemstoneInfo(
                            context,
                            gem['country'],
                            gem['gem'],
                            '${gem['country']} is famous for its ${gem['gem']}.',
                          );
                        },
                        child: Icon(Icons.location_on,
                            color: getMarkerColor(gem['type']), size: 35),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedGemType,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGemType = newValue!;
                    });
                  },
                  items: <String>[
                    'All',
                    'Sapphire',
                    'Ruby',
                    'Emerald',
                    'Topaz',
                    'Alexandrite',
                    'Opal',
                    'Tanzanite',
                    'Garnet'
                  ].map<DropdownMenuItem<String>>((String gemType) {
                    return DropdownMenuItem<String>(
                      value: gemType,
                      child: Text(
                        gemType,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showGemstoneInfo(
      BuildContext context, String country, String gem, String description) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        title: Text(
          '$gem - $country',
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        actionsAlignment: MainAxisAlignment.center, // Align buttons center
        actions: [
          // Close Button
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getMarkerColor(String type) {
    switch (type) {
      case 'Sapphire':
        return Colors.blue;
      case 'Ruby':
        return Colors.red;
      case 'Emerald':
        return Colors.green;
      case 'Topaz':
        return Colors.orange;
      case 'Alexandrite':
        return Colors.teal;
      case 'Opal':
        return Colors.cyan;
      case 'Tanzanite':
        return Colors.indigo;
      case 'Garnet':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }
}
