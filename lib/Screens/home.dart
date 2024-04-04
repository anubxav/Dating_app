import 'package:dating_app/Screens/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: (int index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const Center(
          child: Text('No new matches'),
        );
      case 1:
        return _buildSearchScreen();
      case 2:
        return const ProfileScreen();
      default:
        return const SizedBox(); // Placeholder, should not reach here
    }
  }

  Widget _buildSearchScreen() {
    List<String> recentSearches = [
      'Riya',
      'Priyanka',
      'Ishika'
    ]; // Example recent searches

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Implement search functionality here
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            recentSearches.isNotEmpty
                ? DropdownButton<String>(
                    hint: const Text('Recent Searches'),
                    items: recentSearches.map((String search) {
                      return DropdownMenuItem<String>(
                        value: search,
                        child: Text(search),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Implement action when a recent search is selected
                    },
                  )
                : const SizedBox(), // Placeholder if there are no recent searches
          ],
        ),
      ),
    );
  }
}
