import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'gem.dart';
import 'gem_data.dart';

class EncyclopediaScreen extends StatefulWidget {
  @override
  _EncyclopediaScreenState createState() => _EncyclopediaScreenState();
}

class _EncyclopediaScreenState extends State<EncyclopediaScreen> {
  String searchQuery = "";
  bool isGridView = true; // Toggle between GridView & ListView

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 600;

    // Filter gems based on the search query
    List<Gem> filteredGems = gems
        .where(
            (gem) => gem.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Gem Encyclopedia"),
              background: Image.asset(
                'assets/images/gem_backg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(isGridView ? Icons.list : Icons.grid_view),
                onPressed: () {
                  setState(() {
                    isGridView = !isGridView;
                  });
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for a gem...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
              ),
            ),
          ),
          filteredGems.isEmpty
              ? SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "No results found.",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                )
              : isGridView
                  ? SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _buildGemCard(
                                filteredGems[index], isLargeScreen);
                          },
                          childCount: filteredGems.length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isLargeScreen ? 5 : 3,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return _buildGemListTile(filteredGems[index]);
                        },
                        childCount: filteredGems.length,
                      ),
                    ),
        ],
      ),
    );
  }

  Widget _buildGemCard(Gem gem, bool isLargeScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(gem: gem)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'gem-${gem.name}',
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  gem.imageUrl,
                  height: isLargeScreen ? 150 : 120, // Reduced height
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              // Allows text to take remaining space
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gem.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  maxLines: 2, // Prevents overflow
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGemListTile(Gem gem) {
    return ListTile(
      leading: Hero(
        tag: 'gem-${gem.name}',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            gem.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(gem.name, style: TextStyle(fontSize: 18)),
      subtitle: Text(
        gem.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(gem: gem)),
        );
      },
    );
  }
}
