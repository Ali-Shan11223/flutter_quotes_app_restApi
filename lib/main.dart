import 'package:flutter/material.dart';
import 'package:flutter_quotes_app/views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'models/quotes_model.dart';
import 'providers/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Quotes()),
      ChangeNotifierProvider(create: (context) => Favorite())
    ],
    child: MaterialApp(
          title: 'Quote of the Day',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Lato',
            scaffoldBackgroundColor: Colors.grey.shade300,
            useMaterial3: true,
          ),
          home: const SplashScrenn(),
        ),
    );
  }
}
