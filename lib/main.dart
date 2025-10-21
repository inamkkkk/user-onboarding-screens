import 'package:flutter/material.dart';
import 'package:onboarding_app/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';

import 'models/onboarding_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardingModel()),
      ],
      child: MaterialApp(
        title: 'Onboarding App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OnboardingScreen(),
      ),
    );
  }
}
