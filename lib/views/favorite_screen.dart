import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_provider.dart';
import '../widgets/quote_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteQuotes = Provider.of<Favorite>(context).favorites;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: favoriteQuotes.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: favoriteQuotes[index], child: const QuoteCard());
                  }),
            )
          ],
        ),
      )),
    );
  }
}
