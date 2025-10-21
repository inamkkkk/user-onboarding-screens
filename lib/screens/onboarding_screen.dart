import 'package:flutter/material.dart';
import 'package:onboarding_app/models/onboarding_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnboardingModel>(
        builder: (context, model, child) {
          return Stack(
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (index) {
                  model.currentPage = index;
                },
                children: [
                  _buildPage(context, 'Welcome!', 'Explore exciting features', 'lib/assets/images/image1.png'),
                  _buildPage(context, 'Discover', 'Learn new things every day', 'lib/assets/images/image2.png'),
                  _buildPage(context, 'Get Started', 'Enjoy the app!', 'lib/assets/images/image3.png'),
                ],
              ),
              Container(
                alignment: Alignment(0, 0.75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Text('Skip'),
                      onTap: () {},
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.indigo,
                        dotColor: Colors.indigo.shade100,
                        dotHeight: 16,
                        dotWidth: 16,
                        expansionFactor: 4,
                      ),
                    ),
                    model.currentPage == 2
                        ? GestureDetector(
                            child: Text('Done'),
                            onTap: () {},
                          )
                        : GestureDetector(
                            child: Text('Next'),
                            onTap: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                          ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, String title, String description, String imagePath) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 200),
          SizedBox(height: 30),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                title,
                textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                speed: const Duration(milliseconds: 50),
              ),
            ],
            isRepeatingAnimation: false,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
