// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class GemstoneMapScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Geographic Gemstone Map')),
//       body: FlutterMap(
//         options: MapOptions(
//           center: LatLng(20.0, 0.0), // Center of the world map
//           zoom: 2.0,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//           ),
//           MarkerLayer(
//             markers: [
//               // Example: Marker for Sri Lanka (Sapphires)
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: LatLng(7.8731, 80.7718),
//                 builder: (ctx) => GestureDetector(
//                   onTap: () {
//                     showGemstoneInfo(context, 'Sri Lanka', 'Blue Sapphire',
//                         'Sri Lanka is famous for its high-quality Blue Sapphires...');
//                   },
//                   child: Icon(Icons.location_on, color: Colors.blue, size: 30),
//                 ),
//               ),
//               // Example: Marker for Colombia (Emeralds)
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: LatLng(4.5709, -74.2973),
//                 builder: (ctx) => GestureDetector(
//                   onTap: () {
//                     showGemstoneInfo(context, 'Colombia', 'Emerald',
//                         'Colombia produces 70% of the world’s emeralds...');
//                   },
//                   child: Icon(Icons.location_on, color: Colors.green, size: 30),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

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
//           TextButton(
//             onPressed: () {
//               // Navigate to AR page (if implemented)
//               Navigator.pop(context);
//             },
//             child: Text('View in AR'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GemstoneMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Geographic Gemstone Map')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(20.0, 0.0), // Center of the world map
          initialZoom: 2.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              // Sri Lanka - Blue Sapphire
              Marker(
                point: LatLng(7.8731, 80.7718),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Sri Lanka', 'Blue Sapphire',
                        'Sri Lanka is famous for its high-quality Blue Sapphires.');
                  },
                  child: Icon(Icons.location_on, color: Colors.blue, size: 30),
                ),
              ),

              // Colombia - Emerald
              Marker(
                point: LatLng(4.5709, -74.2973),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Colombia', 'Emerald',
                        'Colombia produces 70% of the world’s emeralds.');
                  },
                  child: Icon(Icons.location_on, color: Colors.green, size: 30),
                ),
              ),

              // Myanmar - Ruby
              Marker(
                point: LatLng(21.9162, 95.9560),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Myanmar', 'Ruby',
                        'Myanmar’s Mogok Valley is famous for the "Pigeon’s Blood" Ruby.');
                  },
                  child: Icon(Icons.location_on, color: Colors.red, size: 30),
                ),
              ),

              // Brazil - Topaz
              Marker(
                point: LatLng(-14.2350, -51.9253),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Brazil', 'Topaz',
                        'Brazil is the leading producer of Imperial Topaz.');
                  },
                  child:
                      Icon(Icons.location_on, color: Colors.orange, size: 30),
                ),
              ),

              // Madagascar - Pink Sapphire
              Marker(
                point: LatLng(-18.8792, 47.5079),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Madagascar', 'Pink Sapphire',
                        'Madagascar is a top producer of Pink Sapphires.');
                  },
                  child: Icon(Icons.location_on, color: Colors.pink, size: 30),
                ),
              ),

              // India - Star Sapphire
              Marker(
                point: LatLng(20.5937, 78.9629),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'India', 'Star Sapphire',
                        'India’s Kashmir region is famous for deep-blue Star Sapphires.');
                  },
                  child: Icon(Icons.location_on,
                      color: Colors.deepPurple, size: 30),
                ),
              ),

              // Russia - Alexandrite
              Marker(
                point: LatLng(61.5240, 105.3188),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Russia', 'Alexandrite',
                        'Russia’s Ural Mountains produced the first color-changing Alexandrite.');
                  },
                  child: Icon(Icons.location_on, color: Colors.teal, size: 30),
                ),
              ),

              // Australia - Opal
              Marker(
                point: LatLng(-25.2744, 133.7751),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Australia', 'Opal',
                        'Australia is the largest producer of precious opals.');
                  },
                  child: Icon(Icons.location_on, color: Colors.cyan, size: 30),
                ),
              ),

              // Tanzania - Tanzanite
              Marker(
                point: LatLng(-6.3690, 34.8888),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Tanzania', 'Tanzanite',
                        'Tanzanite is found only in Tanzania near Mount Kilimanjaro.');
                  },
                  child:
                      Icon(Icons.location_on, color: Colors.indigo, size: 30),
                ),
              ),

              // Thailand - Garnet
              Marker(
                point: LatLng(15.8700, 100.9925),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Thailand', 'Garnet',
                        'Thailand is known for bright orange Spessartite Garnets.');
                  },
                  child: Icon(Icons.location_on, color: Colors.brown, size: 30),
                ),
              ),

              // Example: Marker for Sri Lanka (Sapphires)
              Marker(
                point: LatLng(7.8731, 80.7718),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Sri Lanka', 'Blue Sapphire',
                        'Sri Lanka is famous for its high-quality Blue Sapphires...');
                  },
                  child: Icon(Icons.location_on, color: Colors.blue, size: 30),
                ),
              ),
              // Example: Marker for Colombia (Emeralds)
              Marker(
                point: LatLng(4.5709, -74.2973),
                width: 80.0,
                height: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showGemstoneInfo(context, 'Colombia', 'Emerald',
                        'Colombia produces 70% of the world’s emeralds...');
                  },
                  child: Icon(Icons.location_on, color: Colors.green, size: 30),
                ),
              ),
            ],
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
        title: Text('$gem - $country'),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          TextButton(
            onPressed: () {
              // Navigate to AR page (if implemented)
              Navigator.pop(context);
            },
            child: Text('View in AR'),
          ),
        ],
      ),
    );
  }
}
