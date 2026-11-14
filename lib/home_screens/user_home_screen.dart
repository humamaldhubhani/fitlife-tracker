// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:virtual_bookstore/configs/crud.dart';
import 'package:virtual_bookstore/configs/link.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class User_Home_Screen extends StatefulWidget {
  final user;
  const User_Home_Screen({super.key,this.user}) ;

  @override
  State<User_Home_Screen> createState() => _User_Home_ScreenState();
}

class _User_Home_ScreenState extends State<User_Home_Screen> {
  List plans = [];
  Crud crud = Crud();
  int _selectedIndex = 0;

  getcat() async {
    var res = await crud.getData(home);
    if (res != null && res['status'] == 'success') {
      plans.addAll(res['plan']);
    } else {
      print("Error loading data");
    }
    setState(() {});
  }

  @override
  void initState() {
    getcat();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("object");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.fitness_center, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Fitness',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0D47A1), Color(0xFF42A5F5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFBBDEFB), Color(0xFFE3F2FD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: plans.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    final plan = plans[index];
                    return GestureDetector(
                      onTap: () {
                        // Add navigation or action here
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                     
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(24),
                                ),
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${plan['Name']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1E88E5),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${plan['Description']}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-edit-book');
        },
        backgroundColor: const Color(0xFF1E88E5),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2), // Shadow above the BottomAppBar
            ),
          ],
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                color: _selectedIndex == 0 ? Color(0xFF1E88E5) : Colors.grey,
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: const Icon(Icons.explore),
                color: _selectedIndex == 1 ? Color(0xFF1E88E5) : Colors.grey,
                onPressed: () => _onItemTapped(1),
              ),
              const SizedBox(width: 48), // Space for FAB
              IconButton(
                icon: const Icon(Icons.person),
                color: _selectedIndex == 2 ? Color(0xFF1E88E5) : Colors.grey,
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                color: _selectedIndex == 3 ? Color(0xFF1E88E5) : Colors.grey,
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
          color: Colors.transparent, // Set to transparent
          elevation: 0, // Remove default shadow
        ),
      ),
    );
  }
}
