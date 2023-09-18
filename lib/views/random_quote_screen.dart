import 'package:flutter/material.dart';
import 'package:flutter_quotes_app/models/quotes_model.dart';
import 'package:provider/provider.dart';
import '../services/api_services.dart';
import '../widgets/quote_card.dart';
import '../widgets/refresh_button.dart';

class RandomQuoteScreen extends StatefulWidget {
  const RandomQuoteScreen({super.key});

  @override
  State<RandomQuoteScreen> createState() => _RandomQuoteScreenState();
}

class _RandomQuoteScreenState extends State<RandomQuoteScreen> {
  Future<Quotes> getRandomQuotes() async {
    return await APIServices.getRandomQuotes();
  }

  @override
  void initState() {
    getRandomQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Quote of the Day',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder<Quotes>(
              future: getRandomQuotes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('An error has occured: ${snapshot.hasError}'),
                  );
                } else if (snapshot.data == null) {
                  return const Center(
                    child: Text('No quotes has bee fetched yet!!!'),
                  );
                }
                return ChangeNotifierProvider.value(
                    value: snapshot.data, child: const QuoteCard());
              }),
          GestureDetector(
              onTap: () {
                setState(() {
                  getRandomQuotes();
                });
              },
              child: const RefreshButton()),
        ],
      ),
    );
  }
}
