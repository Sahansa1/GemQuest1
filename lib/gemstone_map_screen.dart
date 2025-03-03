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
              color: Color.fromARGB(255, 255, 255, 255)), // Back icon
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
