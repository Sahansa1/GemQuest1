import 'package:flutter/material.dart';
import 'gem.dart';
import 'detail_screen.dart';
import 'gem_data.dart';

class EncyclopediaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(title: Text('Gem Encyclopedia'),backgroundColor:Color(0xFF67ACF5),),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/gem_backg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: isLargeScreen
                ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // For larger screens, show grid
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: gems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(gem: gems[index]),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(gems[index].imageUrl, fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(gems[index].name, style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
                : ListView.builder(
              itemCount: gems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(gems[index].name),
                  subtitle: Text(gems[index].description),
                  leading: Image.asset(gems[index].imageUrl, width: 50, height: 50),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(gem: gems[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      )


    );
  }
}
