import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Colors consistent with UsersTrainers gradient but as solid colors
  final List<Color> pageColors = [
    Color(0xFF58BBC1), // First page: light blue
    Color(0xFF2A7CA2), // Second page: darker blue
    Color(0xFF054680), // Third page: navy blue
  ];
  final List<Color> buttonColors = [
    Color.fromARGB(255, 73, 154, 159), // First page: light blue
    Color.fromARGB(255, 29, 83, 108), // Second page: darker blue
    Color.fromARGB(255, 3, 43, 79), // Third page: navy blue
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> onboardingPages = [
      buildPage(
        title: "Welcome to FitLife Tracker",
        description: "Your personal companion for achieving your fitness goals.",
        icon: Icons.fitness_center,
        backgroundColor: pageColors[0],
      ),
      buildPage(
        title: "Custom Fitness Plans",
        description: "Find tailored plans by top trainers to suit your needs.",
        icon: Icons.assignment,
        backgroundColor: pageColors[1],
      ),
      buildPage(
        title: "Track Your Progress",
        description: "Stay motivated by tracking your achievements and progress.",
        icon: Icons.bar_chart,
        backgroundColor: pageColors[2],
      ),
    ];

    return Scaffold(
      backgroundColor: pageColors[_currentPage],
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (index) => setState(() {
                _currentPage = index;
              }),
              itemBuilder: (context, index) => onboardingPages[index],
            ),
          ),
          buildFooter(context),
        ],
      ),
    );
  }

  Widget buildPage({
    required String title,
    required String description,
    required IconData icon,
    required Color backgroundColor,
  }) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 100, color: backgroundColor.withOpacity(0.8)),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Container(
      color: buttonColors[_currentPage],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.white70,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _currentPage == 2
                ? () => Navigator.pushReplacementNamed(context, '/login')
                : () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
            child: Text(_currentPage == 2 ? "Get Started" : "Next"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              
              foregroundColor: pageColors[_currentPage],
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
