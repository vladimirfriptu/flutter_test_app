import 'package:flutter/material.dart';

import '../widgets/star_icon_widget.dart';

class AuthScreensContainer extends StatelessWidget {
  final List<Widget> children;

  const AuthScreensContainer({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFECEFF6),
                    Color(0xFFD8E4F2),
                  ],
                ),
              )
          ),
          const StarIconWidget(
            top: 57,
            right: 55,
            width: 14,
            height: 14,
          ),
          StarIconWidget(
            top: screenHeight * 0.29,
            left: screenWidth * 0.29,
            width: 14,
            height: 14,
          ),
          StarIconWidget(
            top: screenHeight * 0.32,
            left: screenWidth * 0.16,
            width: 21.5,
            height: 21.5,
          ),
          StarIconWidget(
            top: screenHeight * 0.77,
            left: screenWidth * 0.24,
            width: 27,
            height: 27,
          ),
          StarIconWidget(
            top: screenHeight * 0.8,
            right: screenWidth * 0.25,
            width: 21.5,
            height: 21.5,
          ),
          StarIconWidget(
            top: screenHeight * 0.92,
            left: screenWidth * 0.18,
            width: 14.2,
            height: 14.2,
          ),
          SafeArea(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children
                ),
              )
          )
        ],
      ),
    );
  }
}